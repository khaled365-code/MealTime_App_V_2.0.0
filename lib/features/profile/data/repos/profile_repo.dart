
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/commons/global_models/local_notifications_model.dart';
import '../../../../core/database/errors/error_model.dart';
import '../models/specific_chef_meals_model/chef_meals.dart';
import '../models/specific_chef_meals_model/chef_meals_model.dart';

abstract class ProfileRepo
{



 Future<Either<ErrorModel,SpecificChefMealsModel>>getChefMeals({required String chefIId});

 Future<Either<ErrorModel,String>>deleteMyAccount({required String chefId});

 Future<Either<ErrorModel,String>>logOut();

 Future<Either<ErrorModel,String>>changePasswordForAccount({required String oldPassword,required String newPassword,required String confirmPassword});

 Future<Either<ErrorModel,String>> updateProfile(
     {  String? name,  String? phone,
       String? brandName,  double? minCharge,
       String? disc,  MultipartFile? profilePic});


 Either<Exception,List<SpecificChefMeals>> getCachedChefMeals();



 // for local notifications

 Future<Unit> saveLocalNotification({required LocalNotificationsModel localNotification});

 Either<Exception,List<LocalNotificationsModel>> getCachedLocalNotifications();

 Future<Unit> deleteNotification({required int localNotificationId,required int index});

 Future<Unit> clearAllNotifications();


}