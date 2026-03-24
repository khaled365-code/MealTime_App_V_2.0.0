/// name : "Blah Sham"
/// description : "delicious and easy to eat"
/// price : 500
/// howToSell : "number"
/// images : ["https://res.cloudinary.com/dx2kspdex/image/upload/v1721328933/Meals/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgtJInLNIlnN3xMPhfsFfZ5/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgKa9H3fGzHZOVtGbuVSngi.jpg"]
/// category : "Desserts"
/// chefId : "669317009bc8bcfb2b1f3894"
/// status : "pending"
/// _id : "669965266ce45ba65ecc19e2"
/// createdAt : "2024-07-18T18:55:34.534Z"
/// updatedAt : "2024-07-18T18:55:34.534Z"
/// __v : 0

class NewMealAdded {
  NewMealAdded({
      this.name, 
      this.description, 
      this.price, 
      this.howToSell, 
      this.images, 
      this.category, 
      this.chefId, 
      this.status, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  NewMealAdded.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    howToSell = json['howToSell'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    category = json['category'];
    chefId = json['chefId'];
    status = json['status'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? name;
  String? description;
  num? price;
  String? howToSell;
  List<String>? images;
  String? category;
  String? chefId;
  String? status;
  String? id;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['howToSell'] = howToSell;
    map['images'] = images;
    map['category'] = category;
    map['chefId'] = chefId;
    map['status'] = status;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}