


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'password'.tr(context),
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(
            end: 24.w),
        child: CustomOutlineTextField(
          maxLines: 1,
          obscureText: SignupCubit.get(context).passwordSecureText,
          suffixIcon: GestureDetector(
            onTap: () {
              SignupCubit.get(context).changePasswordIconShape();
            },
            child: Icon(
              SignupCubit.get(context).passwordSuffixIcon,color: AppColors.cB4B9CA,),
          ),
          validator: (value) {
            if (value!.isEmpty)
            {
              return 'mustEnterPassword'.tr(context);
            }
            else if(value != SignupCubit.get(context).confirmPassController.text)
            {
              return 'passwordsNotMatch'.tr(context);
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).passwordController,
          hintText: '* * * * * * * * * *',
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
