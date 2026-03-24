


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'name'.tr(context),
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(end: 24.w),
        child: CustomOutlineTextField(
          maxLines: 1,
          validator: (value) {
            if (value!.isEmpty)
            {
              return 'mustEnterYourName'.tr(context);
            }
            if(value.length > 20)
            {
              return 'nameLength20'.tr(context);
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).nameController,
          hintText: 'example: John doe',
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
