

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/edit_profile_cubit/edit_profile_cubit.dart';

class EditProfilePhoneField extends StatelessWidget {
  const EditProfilePhoneField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'phoneNumber'.tr(context).toUpperCase(),
        childWidget: CustomOutlineTextField(
          inputFormatters:
          [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
          ],
          controller: EditProfileCubit.get(context).phoneController,
          keyboardType: TextInputType.number,
          maxLines: 1,
          validator: (value)
          {
            if(value!.isEmpty)
              {
                return 'phoneMustNotBeEmpty'.tr(context);
              }
            if(value.length < 10)
            {
              return 'phoneLength10'.tr(context);
            }
            else
            {
              return null;
            }
          },
        ));
  }
}
