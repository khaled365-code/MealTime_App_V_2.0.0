

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/utils/services/internet_connection_service.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/forget_pass_cubit/forget_pass_cubit.dart';

class EmailFieldSendCode extends StatelessWidget {
  const EmailFieldSendCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'email'.tr(context),
        childWidget: CustomOutlineTextField(
          controller: ForgetPassCubit.get(context).emailForForgetPassController,
          hintText: 'example@gmail.com',
          hintStyle: AppTextStyles.regular14(context).copyWith(
              color: AppColors.c32343E),
          keyboardType: TextInputType.emailAddress,
          onFieldSubmitted: (value) async
          {
            if(await InternetConnectionCheckingService.checkInternetConnection()==true)
            {
            if (ForgetPassCubit.get(context).sendEmailFormKey.currentState!.validate())
            {
            ForgetPassCubit.get(context).sendEmailFormKey.currentState!.save();
            ForgetPassCubit.get(context).forgetPassSendCodeFun(
            email: ForgetPassCubit.get(context).emailForForgetPassController.text);
            }
            else
            {
            ForgetPassCubit.get(context).activateSendCodeAutoValidateMode();
            }
            }
            else
            {
            buildScaffoldMessenger(context: context, msg: 'youAreOffline'.tr(context),iconWidget: Icon(Icons.wifi_off,color: AppColors.white,));

            }
          },
          validator: (value)
          {
            if (value!.isEmpty)
            {
              return 'youMustEmail'.tr(context);
            }
            if (EmailValidator.validate(value) == false)
            {
              return 'invalidEmail'.tr(context);
            }
            else
            {
              return null;
            }
          },

        ));
  }
}
