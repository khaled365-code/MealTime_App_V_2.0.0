import 'new_meal.dart';

/// message : "Done"
/// newMeal : {"name":"Blah Sham","description":"delicious and easy to eat","price":500,"howToSell":"number","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1721328933/Meals/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgtJInLNIlnN3xMPhfsFfZ5/%D8%A8%D9%84%D8%AD%20%D8%B4%D8%A7%D9%85.jpgKa9H3fGzHZOVtGbuVSngi.jpg"],"category":"Desserts","chefId":"669317009bc8bcfb2b1f3894","status":"pending","_id":"669965266ce45ba65ecc19e2","createdAt":"2024-07-18T18:55:34.534Z","updatedAt":"2024-07-18T18:55:34.534Z","__v":0}

class AddMealModel {
  AddMealModel({
      this.message, 
      this.newMeal,});

  AddMealModel.fromJson(dynamic json) {
    message = json['message'];
    newMeal = json['newMeal'] != null ? NewMealAdded.fromJson(json['newMeal']) : null;
  }
  String? message;
  NewMealAdded? newMeal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (newMeal != null) {
      map['newMeal'] = newMeal?.toJson();
    }
    return map;
  }

}