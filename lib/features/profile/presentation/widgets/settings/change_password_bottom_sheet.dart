import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/injection/injector.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../cubits/change_password_cubit/change_password_cubit.dart';
import 'change_confirm_pass_field.dart';
import 'change_new_pass_field.dart';
import 'change_old_pass_field.dart';
import 'change_password_buttons_row.dart';
import 'change_password_white_container.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ChangePasswordCubit>(),
      child: BlocListener<ChangePasswordCubit,ChangePasswordState>(
      listener: (context, state)
      {
         handleChangePasswordListener(state, context);
      },
      child:Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            body: Builder(
              builder: (context) {
                return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                 builder: (context, state) {
                 return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Form(
                      key: ChangePasswordCubit.get(context).changePasswordFormKey,
                      autovalidateMode: ChangePasswordCubit.get(context).changePasswordAutoValidateMode,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: _buildBottomSheetDecoration(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SpaceWidget(height: 15,),
                              ChangePasswordWhiteContainer(),
                              state is ChangePasswordLoadingState?
                              Column(
                                children:
                                [
                                  SpaceWidget(height: 20,),
                                  Center(child: Lottie.asset(ImageConstants.loadingLottie)),
                                  SpaceWidget(height: 20,),
                                ],
                              ):Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                            color: AppColors.cEBEBEB,
                                            width: 2.w
                                        )
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                                      child: Column(
                                        children: [
                                          SpaceWidget(height: 20,),
                                          ChangeOldPasswordField(),
                                          SpaceWidget(height: 14,),
                                          ChangeNewPasswordField(),
                                          SpaceWidget(height: 14,),
                                          ChangeConfirmPasswordField(),
                                          SpaceWidget(height: 10,),
                                          Text(
                                            'yourPasswordLong'.tr(context),
                                            style: AppTextStyles.regular14(context).copyWith(
                                                color: AppColors.cA0A5BA
                                            ),),
                                          SpaceWidget(height: 20,),


                                        ],
                                      ),
                                    ),
                                  ),
                                  SpaceWidget(height: 10,),
                                  ChangePasswordButtonsRow(),
                                  SpaceWidget(height: 20,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
  },
);
              }
            ),
          ),
)
    );
  }

  BoxDecoration _buildBottomSheetDecoration()
  {
    return BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      )
                  );
  }

  void handleChangePasswordListener(ChangePasswordState state, BuildContext context)
  {
      if(state is ChangePasswordSuccessState)
      {
        ChangePasswordCubit.get(context).oldPasswordController.clear();
        ChangePasswordCubit.get(context).newPasswordController.clear();
        ChangePasswordCubit.get(context).confirmPasswordController.clear();
        showToast(
            context: context,
            msg: 'passwordChangedSuccessfully'.tr(context),
            toastStates: ToastStates.success);
        Navigator.pop(context);
      }
    if(state is ChangePasswordFailureState)
      {
        if(state.errorModel.error!=null)
        {
          showToast(
              context: context,
              msg: state.errorModel.error!.toString().substring(1,state.errorModel.error!.toString().length-1),
              toastStates: ToastStates.error);
        }
        else
        {
          showToast(
              context: context,
              msg: state.errorModel.errorMessage!, toastStates: ToastStates.error);
        }
      }
  }
}





