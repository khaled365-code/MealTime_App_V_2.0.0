import 'chef_meals.dart';

/// message : "Done"
/// meals : [{"_id":"669a8f9feabc664e27d9558d","name":"Blah Sham","description":"delicious and easy to eat","price":200,"howToSell":"quantity","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1721405343/Meals/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgcYkxXKEiDorIm9J7cyNNt/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgtDHSNXemxWmg_s9cC-Lat.jpg"],"category":"Desserts","chefId":"669317009bc8bcfb2b1f3894","status":"accepted","createdAt":"2024-07-19T16:09:03.693Z","updatedAt":"2024-07-19T16:09:29.584Z","__v":0},{"_id":"669a938aadba6a180f6c6a17","name":"Pelmini","description":"Russia national dish","price":650,"howToSell":"number","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1721406346/Meals/pelmini.webpWCHJOcYUNrcZ9BEAseJG7/pelmini.webpmDwihv7oCDWRu2FRfLFej.webp"],"category":"Beef","chefId":"669317009bc8bcfb2b1f3894","status":"accepted","createdAt":"2024-07-19T16:25:47.140Z","updatedAt":"2024-07-19T16:26:50.974Z","__v":0},{"_id":"669a9405adba6a180f6c6a30","name":"Chicken","description":"delicious and spicy 1/2 kilo","price":1000,"howToSell":"quantity","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1721406468/Meals/chick.jpgHKeSmuVmbS9U7jt3Oy9yt/chick.jpgcgG7BFkPDXTA6ZSV-Sffz.jpg"],"category":"Chicken","chefId":"669317009bc8bcfb2b1f3894","status":"accepted","createdAt":"2024-07-19T16:27:49.439Z","updatedAt":"2024-07-19T16:28:37.230Z","__v":0}]

class SpecificChefMealsModel {
  SpecificChefMealsModel({
      this.message, 
      this.meals,});

  SpecificChefMealsModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['meals'] != null) {
      meals = [];
      json['meals'].forEach((v) {
        meals?.add(SpecificChefMeals.fromJson(v));
      });
    }
  }
  String? message;
  List<SpecificChefMeals>? meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (meals != null) {
      map['meals'] = meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}