


import 'package:flutter/material.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/forget_pass_cubit/forget_pass_cubit.dart';

class ConfirmPassField extends StatelessWidget {
  const ConfirmPassField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'confirmPassword'.tr(context),
        childWidget: CustomOutlineTextField(
          maxLines: 1,
          suffixIcon: GestureDetector(
              onTap: ()
              {
                ForgetPassCubit.get(context).changeConfirmNewPasswordShape();
              },
              child: Icon(ForgetPassCubit.get(context).confirmNewPasswordIcon,color: AppColors.cB4B9CA,)),
          obscureText: ForgetPassCubit.get(context).confirmNewPasswordObscure,
          controller: ForgetPassCubit.get(context).confirmNewPasswordController,
          hintText: 'example@gmail.com',
          hintStyle: AppTextStyles.regular14(context).copyWith(
              color: AppColors.c32343E),
          keyboardType: TextInputType.text,
          validator: (value)
          {
            if(value!.isEmpty)
            {
              return 'youMustConfirmPassword'.tr(context);
            }
            if(value!=ForgetPassCubit.get(context).newPasswordController.text)
            {
              return 'passwordsNotMatch'.tr(context);
            }
            else
            {
              return null;
            }
          },

        ));
  }
}
