

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import 'package:new_meal_time_app/core/utils/app_assets.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../../core/widgets/name_and_text_field_widget.dart';
import '../cubits/forget_pass_cubit/forget_pass_cubit.dart';
import '../widgets/auth_header.dart';
import '../widgets/forget_pass_change/confirm_pass_field.dart';
import '../widgets/forget_pass_change/new_password_field.dart';
import '../widgets/forget_pass_change/otp_code_container.dart';
import '../../../../../core/utils/app_colors.dart';


class ForgetPassChangeScreen extends StatelessWidget {
  const ForgetPassChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String emailText=ModalRoute.of(context)!.settings.arguments as String;
    return BlocListener<ForgetPassCubit, ForgetPassState>(
  listener: (context, state)
  {
    handleChangePassListener(state, context);
  },
  child: Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              AuthHeaderWidget(
                  title: 'verification'.tr(context),
                  subTitle: 'WeSentCodeEmail'.tr(context)+'\n$emailText',
                 hasBackButton: true,
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height*(525/812),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.r),
                      topLeft: Radius.circular(25.r),
                    ),
                ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
                    child: BlocBuilder<ForgetPassCubit, ForgetPassState>(
                    builder: (context, state) {
                   return Form(
                      autovalidateMode: ForgetPassCubit.get(context).verifyCodeAutoValidateMode,
                      key: ForgetPassCubit.get(context).verifyCodeFormKey,
                      child: Column(
                        children:
                        [
                          SpaceWidget(height: 24,),
                          NewPasswordField(),
                          SpaceWidget(height: 24,),
                          ConfirmPassField(),
                          SpaceWidget(height: 24.h,),
                          NameAndTextFieldWidget(
                              title: 'code'.tr(context),
                              childWidget: Row(
                                children: List.generate(
                                    6,
                                    (index) => Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.only(end:  index!=5? 10.w:0),
                                        child: OtpCodeContainer(
                                          singleContainerController: getCodeController(index: index,forgetPassCubit: ForgetPassCubit.get(context)),
                                        ),
                                      ),
                                    ),),
                              )),
                          SpaceWidget(height: 30,),
                          state is ForgetPassChangeWithCodeLoadingState ?
                          Center(
                            child: SharedLoadingIndicator(),):
                          SharedButton(
                            btnText: 'verify'.tr(context),
                            onPressed: ()
                            {
                              verifyCodeActionButton(context, emailText);
                            },
                          ),
                        ],
                      ),
                    );
  },
),
                  ),
                                )

          )]),

    )),
);
  }
  void handleChangePassListener(ForgetPassState state, BuildContext context) {
    if(state is ForgetPassChangeWithCodeFailureState)
    {
      if(state.errorModel.error!=null)
      {
        buildScaffoldMessenger(
            iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),            context: context, msg: state.errorModel.error!.toString()
            .substring(
            1,state.errorModel.error!.toString().length-1));
      }
      else
      {
        buildScaffoldMessenger(
            iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
            context: context,
            msg: state.errorModel.errorMessage!);
      }
    }
    if(state is ForgetPassChangeWithCodeSuccessState)
    {
      buildScaffoldMessenger(
          context: context,
          msg: 'youHaveSetNewPasswordSuccessfully'.tr(context),
          iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon));
      navigate(context: context, route: Routes.loginScreen,replacement: true);
    }
  }



  void verifyCodeActionButton(BuildContext context, String emailText) async {

    if(await InternetConnectionCheckingService.checkInternetConnection()==true)
      {
        if(ForgetPassCubit.get(context).verifyCodeFormKey.currentState!.validate())
        {
          ForgetPassCubit.get(context).verifyCodeFormKey.currentState!.save();
          ForgetPassCubit.get(context).forgetPassChangeWithCodeFun(
              email: emailText,
              code: getCompleteEmail(forgetPassCubit: ForgetPassCubit.get(context)),
              password: ForgetPassCubit.get(context).newPasswordController.text,
              confirmPassword: ForgetPassCubit.get(context).confirmNewPasswordController.text);
        }
        else
        {
          ForgetPassCubit.get(context).activateVerifyCodeAutoValidateMode();
        }
      }
    else
      {
        buildScaffoldMessenger(context: context, msg: 'youAreOffline'.tr(context),iconWidget: Icon(Icons.wifi_off,color: AppColors.white,));
      }

  }

  TextEditingController getCodeController({required int index,required ForgetPassCubit forgetPassCubit})
  {
    switch (index)
    {
      case 0:
        return forgetPassCubit.firstCodeController;
      case 1:
        return forgetPassCubit.secondCodeController;
      case 2:
        return forgetPassCubit.thirdCodeController;
      case 3:
        return forgetPassCubit.fourthCodeController;
      case 4:
        return forgetPassCubit.fifthCodeController;
      case 5:
        return forgetPassCubit.sixthCodeController;
      default:
        return forgetPassCubit.firstCodeController;
    }
  }
  String getCompleteEmail({required ForgetPassCubit forgetPassCubit})
  {
    return forgetPassCubit.firstCodeController.text+
        forgetPassCubit.secondCodeController.text+
        forgetPassCubit.thirdCodeController.text+
        forgetPassCubit.fourthCodeController.text+
        forgetPassCubit.fifthCodeController.text+
        forgetPassCubit.sixthCodeController.text;
  }
}


