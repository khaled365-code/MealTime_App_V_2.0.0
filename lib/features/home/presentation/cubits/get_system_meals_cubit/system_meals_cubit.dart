import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta/meta.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/database/errors/error_model.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/services/internet_connection_service.dart';
import '../../../data/models/get_meals_model/get_all_meals_model.dart';
import '../../../data/models/get_meals_model/system_all_meals.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../data/repos/home_repo_implementation.dart';

part 'system_meals_state.dart';

class SystemMealsCubit extends Cubit<SystemMealsState> {
  SystemMealsCubit({required this.homeRepoImplementation}) : super(SystemMealsInitial());

  final HomeRepoImplementation homeRepoImplementation;



  static SystemMealsCubit get(context)=> BlocProvider.of(context);




  GetAllMealsModel? allMealsModel;
  List<SystemMeals>? cachedSystemMeals;
  Future<void> getAllMealsFromApiFun() async
  {
    emit(GetAllMealsLoadingState());
    log('meals from api');
    final response=await homeRepoImplementation.getAllMeals();
    emit(getStateAfterRequest(response));

  }

  void getMealsFromCacheFun()
  {
    log('meals from cache');
    final data= homeRepoImplementation.getCachedMeals();
    data.fold((exception)
    {
      emit(GetCachedMealsFailureState());

    }, (mealsList)
    {
      cachedSystemMeals=mealsList;
      emit(GetCachedMealsSuccessState());

    },);
  }

  generalGetMealsFun(BuildContext context,bool isHomeScreen) async
  {
    if (await InternetConnectionCheckingService.checkInternetConnection()==true)
    {
      await getAllMealsFromApiFun();
      log('meals from api');
      buildScaffoldMessenger(
          context: context,
          msg: 'mealsFetchedSuccessfully'.tr(context),
          iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
          snackBarBehavior: isHomeScreen==true? SnackBarBehavior.floating:SnackBarBehavior.fixed);


    }
    else
    {
      getMealsFromCacheFun();
      log('meals from cache');
      buildScaffoldMessenger(
          context: context,
          msg: 'youAreOffline'.tr(context),
          iconWidget: Icon(Icons.wifi_off,color: AppColors.white,),
          snackBarBehavior: isHomeScreen==true? SnackBarBehavior.floating:SnackBarBehavior.fixed);

    }
  }

  SystemMealsState getStateAfterRequest(Either<ErrorModel, GetAllMealsModel> response)
  {
    return response.fold((errorModel)
    {
      return GetAllMealsFailureState(errorModel: errorModel);
    }, (getAllMealsModel)
    {
      allMealsModel=getAllMealsModel;
      return GetAllMealsSuccessState(getAllMealsModel: getAllMealsModel);
    });

  }






}