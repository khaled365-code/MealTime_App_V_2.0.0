


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'description'.tr(context),
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(
            end: 24.w),
        child: CustomOutlineTextField(
          validator: (value) {
            if (value!.isEmpty)
            {
              return 'mustEnterDescription'.tr(context);
            }
            if(value.length < 20)
            {
              return 'descriptionLess20'.tr(context);
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).descriptionController,
          hintText: 'example: fast food brand',
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
        ),
      ),
    );
  }
}
