import 'system_all_meals.dart';

/// message : "Done"
/// meals : [{"_id":"65de3dbe012b561fc7e8edb8","name":"TEst Meal","description":"Test Meal Meal Mealafdsfasdgfsd","price":125,"howToSell":"quantity","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1709063613/Meals/scaled_4f08695f-5083-4f19-8a51-d954fa9aed374182861994691810582.jpgGJrAU8l1eJMw_NBNvT1OO/scaled_4f08695f-5083-4f19-8a51-d954fa9aed374182861994691810582.jpgT6DLJrnbbSeHtzCXwCEEb.jpg"],"category":"Beef","chefId":{"_id":"653aa89d6fa960fe1ac59208","name":"Ammar","phone":"01021570316","brandName":"Ammar Chef"},"status":"accepted","createdAt":"2024-02-27T19:53:34.363Z","updatedAt":"2024-02-27T20:08:29.928Z","__v":0}]

class GetAllMealsModel {
  GetAllMealsModel({
      this.message, 
      this.meals,});

  GetAllMealsModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['meals'] != null) {
      meals = [];
      json['meals'].forEach((v) {
        meals?.add(SystemMeals.fromJson(v));
      });
    }
  }
  String? message;
  List<SystemMeals>? meals;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['message'] = message;
  //   if (meals != null) {
  //     map['meals'] = meals?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }

}