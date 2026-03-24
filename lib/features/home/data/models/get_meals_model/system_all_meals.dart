import 'package:hive_flutter/hive_flutter.dart';

import 'chef_info.dart';

part 'system_all_meals.g.dart';


/// _id : "65de3dbe012b561fc7e8edb8"
/// name : "TEst Meal"
/// description : "Test Meal Meal Mealafdsfasdgfsd"
/// price : 125
/// howToSell : "quantity"
/// images : ["https://res.cloudinary.com/dx2kspdex/image/upload/v1709063613/Meals/scaled_4f08695f-5083-4f19-8a51-d954fa9aed374182861994691810582.jpgGJrAU8l1eJMw_NBNvT1OO/scaled_4f08695f-5083-4f19-8a51-d954fa9aed374182861994691810582.jpgT6DLJrnbbSeHtzCXwCEEb.jpg"]
/// category : "Beef"
/// chefId : {"_id":"653aa89d6fa960fe1ac59208","name":"Ammar","phone":"01021570316","brandName":"Ammar Chef"}
/// status : "accepted"
/// createdAt : "2024-02-27T19:53:34.363Z"
/// updatedAt : "2024-02-27T20:08:29.928Z"
/// __v : 0
///
///
@HiveType(typeId: 10)
class SystemMeals {
  SystemMeals({
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

  SystemMeals.fromJson( json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    howToSell = json['howToSell'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    category = json['category'];
    chefId = json['chefId'] != null ? ChefData.fromJson(json['chefId']) : null;
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
  ChefData? chefId;
  @HiveField(8)
  String? status;
  @HiveField(9)
  String? createdAt;
  @HiveField(10)
  String? updatedAt;
  @HiveField(11)
  num? v;
  @HiveField(12)
  bool itemIsSelected=false;



  toJson(SystemMeals meal)
  {
    final map = <String, dynamic>{};
    map['_id'] = meal.id;
    map['name'] = meal.name;
    map['description'] = meal.description;
    map['price'] = meal.price;
    map['howToSell'] = meal.howToSell;
    map['images'] = meal.images;
    map['category'] = meal.category;
    if (chefId != null) {
      map['chefId'] = meal.chefId?.toJson();
    }
    map['status'] = meal.status;
    map['createdAt'] = meal.createdAt;
    map['updatedAt'] = meal.updatedAt;
    map['__v'] = meal.v;
    return map;
  }

}