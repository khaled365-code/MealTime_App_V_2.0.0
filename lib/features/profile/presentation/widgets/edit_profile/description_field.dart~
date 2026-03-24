

import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/edit_profile_cubit/edit_profile_cubit.dart';

class EditProfileDescriptionField extends StatelessWidget {
  const EditProfileDescriptionField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'Description'.toUpperCase(),
        childWidget: CustomOutlineTextField(
          controller: EditProfileCubit.get(context).discController,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          validator: (value)
          {
            if(value!.isEmpty)
              {
                return 'description must not be empty';
              }
            if(value.length < 20)
            {
              return 'description length must be at least 20 characters long';
            }
            else
            {
              return null;
            }
          },

        ));
  }
}
