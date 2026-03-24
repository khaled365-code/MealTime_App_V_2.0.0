


import 'package:flutter/material.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/edit_profile_cubit/edit_profile_cubit.dart';

class EditProfileBrandNameField extends StatelessWidget {
  const EditProfileBrandNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'brandName'.tr(context).toUpperCase(),
        childWidget: CustomOutlineTextField(
          controller: EditProfileCubit.get(context).brandNameController,
          keyboardType: TextInputType.text,
          maxLines: 1,
          validator: (value) {
            if(value!.isEmpty)
              {
                return 'brandNameMustNotBeEmpty'.tr(context);
              }
            if(value.length<3)
            {
              return 'brandNameLeast3'.tr(context);
            }
            if(value.length>15)
            {
              return 'brandNameLess15'.tr(context);
            }
            else
            {
              return null;
            }
          },
        ));
  }
}
