



import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:new_meal_time_app/features/profile/data/repos/profile_repo.dart';

import '../../../../core/commons/global_models/local_notifications_model.dart';
import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/api_keys.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/errors/error_model.dart';
import '../../../../core/database/errors/server_exception.dart';
import '../../../../core/utils/services/local_notifications_service.dart';
import '../models/specific_chef_meals_model/chef_meals.dart';
import '../models/specific_chef_meals_model/chef_meals_model.dart';

class ProfileRepoImplementation implements ProfileRepo
{

  final ApiConsumer api;

  ProfileRepoImplementation({required this.api});

  var cachedChefMeals=Hive.box<SpecificChefMeals>('cached_chef_meals');

  @override
  Either<Exception, List<SpecificChefMeals>> getCachedChefMeals()
  {
    if(cachedChefMeals.values.isNotEmpty)
    {
      return Right(cachedChefMeals.values.toList());
    }
    else
    {
      return Left(Exception('No Cached Chef Meals Found'));
    }
  }


  @override
  Future<Either<ErrorModel, SpecificChefMealsModel>> getChefMeals({required String chefIId}) async
  {
    try
    {
      final response=await api.get(EndPoints.getSingleChefMealsEndPoint(chefIId: chefIId));
      SpecificChefMealsModel specificChefMealsModel=SpecificChefMealsModel.fromJson(response);
      if(specificChefMealsModel.meals!.isNotEmpty)
        {
          await cachedChefMeals.clear();
          for(var meal in specificChefMealsModel.meals!)
            {
              await cachedChefMeals.add(meal);
            }
        }
      return Right(specificChefMealsModel);
    } on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> deleteMyAccount({required String chefId}) async
  {
    try
    {
      final response=await api.delete(EndPoints.deleteAccountEndPoint(chefIId: chefId));
      return Right(response[ApiKeys.message]);
    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> logOut() async {

    try
    {
      final response=await api.get(EndPoints.chefLogoutEndPoint);
      return Right(response[ApiKeys.message]);
    }
    on ServerException catch(e)
    {
       return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> changePasswordForAccount({required String oldPassword, required String newPassword, required String confirmPassword}) async
  {
    try
    {

      final response=await api.patch(EndPoints.changePasswordForAccountEndPoint,
      data: {
        ApiKeys.oldPass:oldPassword,
        ApiKeys.newPass:newPassword,
        ApiKeys.confirmPassword:confirmPassword
      });

      return Right(response[ApiKeys.message]);

    }on ServerException catch(e)
    {
      return Left(e.errorModel);
    }


  }

  @override
  Future<Either<ErrorModel, String>> updateProfile({
     String? name,
     String? phone,
     String? brandName,
     double? minCharge,
     String? disc,
    MultipartFile? profilePic}) async
  {
    try
    {
      String location='{"name":"Egypt","address":"Mansoura","coordinates":[31.058748054104402, 31.40931322993143]}';
      Map<String,dynamic> data={};
      data[ApiKeys.location]=location;
      if(name!=null)
        {
          data[ApiKeys.name]=name;
        }
      if(phone!=null)
        {
          data[ApiKeys.phone]=phone;
        }
      if(brandName!=null)
        {
          data[ApiKeys.brandName]=brandName;
        }
      if(minCharge!=null)
        {
          data[ApiKeys.minCharge]=minCharge;
        }
      if(disc!=null)
        {
          data[ApiKeys.disc]=disc;
        }

      if(profilePic!=null)
        {
          data[ApiKeys.profilePic]=profilePic;
        }
      final response=await api.patch(
          EndPoints.updateProfileEndPoint,
          data: data
          ,formData: true);
      return Right(response[ApiKeys.message]);
    }
    on ServerException catch(e)
    {
     return Left(e.errorModel);
    }
  }




  // local Notifications :-
  var notificationBox=Hive.box<LocalNotificationsModel>('cached_local_notifications');

  @override
  Either<Exception, List<LocalNotificationsModel>> getCachedLocalNotifications()
  {
    if(notificationBox.values.isNotEmpty)
    {
      return Right(notificationBox.values.toList());
    }
    else
    {
      return Left(Exception('No Notifications Found'));
    }

  }

  @override
  Future<Unit> saveLocalNotification({required LocalNotificationsModel localNotification}) async
  {
    await notificationBox.add(localNotification);
    return Future.value(unit);
  }

  @override
  Future<Unit> clearAllNotifications() async
  {
    await notificationBox.clear();
    await LocalNotificationsService.cancelAllNotifications();
    return Future.value(unit);

  }

  @override
  Future<Unit> deleteNotification({required  int localNotificationId,required int index}) async
  {
    await notificationBox.deleteAt(index);
    await LocalNotificationsService.cancelSpecificNotification(id: localNotificationId);
    return Future.value(unit);

  }





}