

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class MinChargeField extends StatelessWidget {
  const MinChargeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'minCharge',
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(
            end: 24.w),
        child: CustomOutlineTextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          validator: (value) {
            if (value!.isEmpty)
            {
              return 'mustEnterMinCharge'.tr(context);
            }
            else {
              return null;
            }
          },
          controller: SignupCubit.get(context).minimumChargeController,
          hintText: 'example: 1000',
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
