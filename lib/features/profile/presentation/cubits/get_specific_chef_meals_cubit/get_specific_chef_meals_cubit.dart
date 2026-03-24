
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta/meta.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/database/errors/error_model.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/services/internet_connection_service.dart';
import '../../../data/models/specific_chef_meals_model/chef_meals.dart';
import '../../../data/models/specific_chef_meals_model/chef_meals_model.dart';
import '../../../data/repos/profile_repo_implementation.dart';

part 'get_specific_chef_meals_state.dart';

class GetSpecificChefMealsCubit extends Cubit<GetSpecificChefMealsState> {
  GetSpecificChefMealsCubit({required this.profileRepoImplementation}) : super(GetSpecificChefMealsInitial());

  static GetSpecificChefMealsCubit get(context) => BlocProvider.of(context);
  final ProfileRepoImplementation profileRepoImplementation;

  List<SpecificChefMeals>? chefMeals;
  List<SpecificChefMeals>? cachedChefMeals;

  generalGetChefMealsFun({required String chefId,required BuildContext context}) async
  {
    if(await InternetConnectionCheckingService.checkInternetConnection()==true)
      {

        await getChefMealsFromApiFun(chefId);
        buildScaffoldMessenger(
            context: context,
            msg: 'chefMealsFetchedSuccessfully'.tr(context),
            iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
            snackBarBehavior: SnackBarBehavior.floating);

      }
    else
      {
       getCachedChefMealsFun();
       buildScaffoldMessenger(
           context: context,
           msg: 'youAreOffline'.tr(context),
           iconWidget: Icon(Icons.wifi_off,color: AppColors.white,),
           snackBarBehavior: SnackBarBehavior.floating);
      }

  }

  Future<void> getChefMealsFromApiFun(String chefId) async
  {
     emit(GetSpecificChefMealsLoadingState());
    log('chef meals from api');
    final response=await profileRepoImplementation.getChefMeals(chefIId: chefId);
    response.fold(
            (errorModel) => emit(GetSpecificChefMealsFailureState(errorModel: errorModel)),
            (chefMealsModel)
        {
          chefMeals=chefMealsModel.meals;
          emit(GetSpecificChefMealsSuccessState(
              specificChefMealsModel: chefMealsModel));
        });
  }

  void getCachedChefMealsFun()
  {
    final response= profileRepoImplementation.getCachedChefMeals();
    response.fold((l) {
      emit(GetCachedChefMealsFailureState());
    }, (meals) {
      cachedChefMeals=meals;
      emit(GetCachedChefMealsSuccessState());
    },);
  }

}
