import 'package:hive/hive.dart';

/// _id : "669a8f9feabc664e27d9558d"
/// name : "Blah Sham"
/// description : "delicious and easy to eat"
/// price : 200
/// howToSell : "quantity"
/// images : ["https://res.cloudinary.com/dx2kspdex/image/upload/v1721405343/Meals/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgcYkxXKEiDorIm9J7cyNNt/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgtDHSNXemxWmg_s9cC-Lat.jpg"]
/// category : "Desserts"
/// chefId : "669317009bc8bcfb2b1f3894"
/// status : "accepted"
/// createdAt : "2024-07-19T16:09:03.693Z"
/// updatedAt : "2024-07-19T16:09:29.584Z"

part 'chef_meals.g.dart';


@HiveType(typeId: 5)
class SpecificChefMeals extends HiveObject {
  SpecificChefMeals({
      this.id, 
      this.name, 
      this.description, 
      this.price, 
      this.howToSell, 
      this.images, 
      this.category, 
      this.chefId, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  SpecificChefMeals.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    howToSell = json['howToSell'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    category = json['category'];
    chefId = json['chefId'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  num? price;
  @HiveField(4)
  String? howToSell;
  @HiveField(5)
  List<String>? images;
  @HiveField(6)
  String? category;
  @HiveField(7)
  String? chefId;
  @HiveField(8)
  String? status;
  @HiveField(9)
  String? createdAt;
  @HiveField(10)
  String? updatedAt;
  @HiveField(11)
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['howToSell'] = howToSell;
    map['images'] = images;
    map['category'] = category;
    map['chefId'] = chefId;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}