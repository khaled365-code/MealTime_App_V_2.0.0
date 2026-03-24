/// _id : "669a8f9feabc664e27d9558d"
/// name : "Blah Sham"
/// description : "delicious and easy to eat"
/// price : 200
/// howToSell : "quantity"
/// images : ["https://res.cloudinary.com/dx2kspdex/image/upload/v1721405343/Meals/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgcYkxXKEiDorIm9J7cyNNt/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgtDHSNXemxWmg_s9cC-Lat.jpg"]
/// category : "Desserts"
/// status : "accepted"
/// createdAt : "2024-07-19T16:09:03.693Z"

class Menu {
  Menu({
      this.id, 
      this.name, 
      this.description, 
      this.price, 
      this.howToSell, 
      this.images, 
      this.category, 
      this.status, 
      this.createdAt,});

  Menu.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    howToSell = json['howToSell'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    category = json['category'];
    status = json['status'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? name;
  String? description;
  num? price;
  String? howToSell;
  List<String>? images;
  String? category;
  String? status;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['howToSell'] = howToSell;
    map['images'] = images;
    map['category'] = category;
    map['status'] = status;
    map['createdAt'] = createdAt;
    return map;
  }

}