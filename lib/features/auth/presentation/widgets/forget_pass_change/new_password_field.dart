


import 'package:flutter/material.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/forget_pass_cubit/forget_pass_cubit.dart';

class NewPasswordField extends StatelessWidget {
  const NewPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'newPassword'.tr(context),
        childWidget: CustomOutlineTextField(
          maxLines: 1,
          obscureText: ForgetPassCubit.get(context).newPasswordObscure,
          suffixIcon: GestureDetector(
              onTap: ()
              {
                ForgetPassCubit.get(context).changeNewPasswordShape();
              },
              child: Icon(ForgetPassCubit.get(context).newPasswordIcon,color: AppColors.cB4B9CA,)),
          controller: ForgetPassCubit.get(context).newPasswordController,
          hintText: 'example@gmail.com',
          hintStyle: AppTextStyles.regular14(context).copyWith(
              color: AppColors.c32343E),
          keyboardType: TextInputType.text,
          validator: (value)
          {
            if(value!.isEmpty)
            {
              return 'youMustPassword'.tr(context);
            }
            if(ForgetPassCubit.get(context).confirmNewPasswordController.text!=value)
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
