


import 'package:flutter/material.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/edit_profile_cubit/edit_profile_cubit.dart';

class EditProfileNameField extends StatelessWidget {
  const EditProfileNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'fullName'.tr(context).toUpperCase(),
        childWidget: CustomOutlineTextField(
          controller: EditProfileCubit.get(context).nameController,
          keyboardType: TextInputType.text,
          maxLines: 1,
          validator: (value)
          {
            if(value!.isEmpty)
              {
                return 'nameMustNotBeEmpty'.tr(context);
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

        ));
  }
}
