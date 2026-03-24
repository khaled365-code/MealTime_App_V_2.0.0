
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/commons/commons.dart';
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
import '../../cubits/logout_cubit/logout_cubit.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<LogoutCubit>(),
      child: BlocListener<LogoutCubit,LogoutState>(
        listener: (context, state)
        {
          handleLogoutListener(state, context);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 34.24.w,
                height: 35.h,
                decoration: BoxDecoration(
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
              height: MediaQuery.sizeOf(context).height * (316 / 812),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Lottie.asset(ImageConstants.logouAccountLottie2),
                  Text('wantLogout?'.tr(context),
                    style: AppTextStyles.bold20(context)
                        .copyWith(color: AppColors.c181C2E),),
                  SpaceWidget(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: FittedBox(
                      child: Text(
                        'canLoginWithSameEmail'.tr(context),
                        style: AppTextStyles.bold18(context).copyWith(
                            color: AppColors.cA4ACAD
                        ),),
                    ),
                  ),
                  Spacer(),
                  BlocBuilder<LogoutCubit,LogoutState>(
                    builder: (context,state){
                      if (state is LogoutLoadingState)
                        {
                          return Center(child: SharedLoadingIndicator(),);
                        }
                      else
                        {
                          return SharedButton(
                            onPressed: () async
                            {
                              if(await InternetConnectionCheckingService.checkInternetConnection()==true)
                                {
                                  LogoutCubit.get(context).logoutFun();
                                }
                              else
                                {
                                  showDialog(context: context, builder: (context) => NoInternetConnectionDialog(),);
                                }
                            },
                            btnText: 'confirm'.tr(context),
                            btnTextStyle: AppTextStyles.bold16(context).copyWith(
                                color: AppColors.white),);
                        }
                    },
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                    child: Text(
                        'cancel'.tr(context), style: AppTextStyles.bold16(context).copyWith(
                        color: AppColors.primaryColor)),
                  ),
                  Spacer()


                ],
              ),
            )

          ],
        ),
      ),);
  }

  void handleLogoutListener(LogoutState state, BuildContext context) async
  {
    if (state is LogoutSuccessState)
    {
      await CacheHelper().removeData(key: ApiKeys.token);
      navigate(context: context, route: Routes.loginScreen,replacement: true);
    }
    if (state is LogoutFailureState)
    {
      if (state.errorModel.error != null) {
        showToast(
            context: context,
            msg: state.errorModel.error.toString().substring(
            1, state.errorModel.error
            .toString()
            .length - 1),
            toastStates: ToastStates.error);
      }
      else {
        showToast(
            context: context,
            msg: state.errorModel.errorMessage!,
            toastStates: ToastStates.error);
      }
    }
  }
}
