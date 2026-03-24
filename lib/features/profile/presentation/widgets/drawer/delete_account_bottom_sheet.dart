

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/commons/global_models/local_notifications_model.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/injection/injector.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/services/internet_connection_service.dart';
import '../../../../../core/widgets/no_internet_connection_dialog.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../../home/data/models/get_meals_model/system_all_meals.dart';
import '../../../data/models/specific_chef_meals_model/chef_meals.dart';
import '../../cubits/delete_account_cubit/delete_account_cubit.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => locator<DeleteAccountCubit>(),
  child: BlocListener<DeleteAccountCubit, DeleteAccountState>(
  listener: (context, state)
  {
    handleDeleteAccountListener(state, context);
  },
  child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Container(
            width: 34.24.w,
            height: 35.h,
            decoration:BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: Center(
              child: SvgPicture.asset(ImageConstants.closeIcon),
            ),
          ),
        ),
        SpaceWidget(height: 10,),
        Container(
          height: MediaQuery.sizeOf(context).height*(316/812),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  width: 130.w,
                    height: 100.h,
                    child: Image.asset(ImageConstants.trashSuitableGif)),
                Text('sureDeleteAccount?'.tr(context),style: AppTextStyles.bold18(context).copyWith(color: AppColors.c32343E,),),
                SpaceWidget(height: 5,),
                Text('warningDeleteAccount'.tr(context),style: AppTextStyles.regular15(context).copyWith(color: AppColors.cA4ACAD,),),
                Spacer(),
                BlocBuilder<DeleteAccountCubit,DeleteAccountState>(
                  builder: (context, state)
                  {
                    if (state is DeleteMyAccountLoadingState)
                      {
                        return Center(
                          child: SharedLoadingIndicator(),
                        );
                      }
                    else
                      {
                        return SharedButton(
                          customHeight: 50,
                          btnTextStyle: AppTextStyles.bold19(context).copyWith(
                            color: AppColors.white,
                          ),
                          onPressed: () async
                          {
                            if(await InternetConnectionCheckingService.checkInternetConnection()==true)
                              {
                                DeleteAccountCubit.get(context).deleteMyAccountFun(chefId: CacheHelper().getData(key: ApiKeys.id));
                              }
                            else
                              {
                                showDialog(context: context, builder: (context) => NoInternetConnectionDialog(),);
                              }
                          },
                          btnText: 'deleteAccount'.tr(context),);
                      }
                  },
                ),
                Spacer(),



              ]
               ),
          )
        ),
      ],
    ),
));
  }

  void handleDeleteAccountListener(DeleteAccountState state, BuildContext context) async
  {
    if(state is DeleteMyAccountSuccessState)
      {
        var favouriteMealsBox=Hive.box<SystemMeals>('favourite_meals');
        var historyMealsBox=Hive.box<SystemMeals>('history_meals');
        var systemMealsBox=Hive.box<SystemMeals>('cached_system_meals');
        var chefMealsBox=Hive.box<SpecificChefMeals>('cached_chef_meals');
        var localNotificationsBox=Hive.box<LocalNotificationsModel>('cached_local_notifications');
        await Future.wait([
          favouriteMealsBox.clear(),
          historyMealsBox.clear(),
          systemMealsBox.clear(),
          chefMealsBox.clear(),
          localNotificationsBox.clear(),
          CacheHelper().clearData(),
        ]);
        navigate(context: context, route: Routes.loginScreen,replacement: true);
      }
    if(state is DeleteMyAccountFailureState)
      {

        if(state.errorModel.error!=null)
        {
          showToast(
              context: context,
              msg: state.errorModel.error.toString().substring(1,state.errorModel.error.toString().length-1),
              toastStates: ToastStates.error);
        }
        else
        {
         showToast(
             context: context,
             msg: state.errorModel.errorMessage!,
             toastStates: ToastStates.error);
        }
      }
  }
}
