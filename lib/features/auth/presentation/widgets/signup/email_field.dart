

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'email'.tr(context),
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(
            end: 24.w),
        child: CustomOutlineTextField(
          maxLines: 1,
          validator: (value) {
            if (value!.isEmpty) {
              return 'mustEnterEmail'.tr(context);
            }
            if(EmailValidator.validate(value)==false)
            {
              return 'invalidEmail'.tr(context);
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).emailController,
          hintText: 'example@gmail.com',
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
