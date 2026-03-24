

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/utils/services/internet_connection_service.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/login_cubit/login_cubit.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'password',
      childWidget:  Padding(
        padding:  EdgeInsetsDirectional.only(end: 24.w),
        child: CustomOutlineTextField(
          obscureText: LoginCubit.get(context).isObsecureText,
          maxLines: 1,
          validator: (value)
          {
            if(value!.isEmpty)
            {
              return 'youMustPassword'.tr(context);
            }
            else
            {
              return null;
            }
          },
          onFieldSubmitted: (value) async
          {
            if(await InternetConnectionCheckingService.checkInternetConnection()==true)
            {
            if(LoginCubit.get(context).loginFormKey.currentState!.validate())
            {
            LoginCubit.get(context).loginFormKey.currentState!.save();
            LoginCubit.get(context).loginFun(
            email: LoginCubit.get(context).emailController.text,
            password: LoginCubit.get(context).passwordController.text);
            }
            else
            {
            LoginCubit.get(context).changeValidateMode();
            }
            }
            else
            {
            buildScaffoldMessenger(context: context, msg: 'youAreOffline'.tr(context),iconWidget: Icon(Icons.wifi_off,color: AppColors.white,));
            }
          },
          controller: LoginCubit.get(context).passwordController,
          hintText: '* * * * * * * * * *',
          keyboardType: TextInputType.text,
          suffixIcon: GestureDetector(
              onTap: ()
              {

                LoginCubit.get(context).changeEyeShape();
              },
              child: Icon(LoginCubit.get(context).suffixIcon,color: AppColors.cB4B9CA,)),
        ),
      ),);
  }
}
