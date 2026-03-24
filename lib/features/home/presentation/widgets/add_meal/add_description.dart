

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/add_meal_cubit/add_meal_cubit.dart';

class AddMealDiscTextField extends StatelessWidget {
  const AddMealDiscTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'mealDescription'.tr(context),
        childWidget: CustomOutlineTextField(
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLength: 214,
          controller: AddMealCubit.get(context).mealDescriptionController,
          hintText: 'writeMealDescription'.tr(context),
          validator: (value) {
            if(value!.isEmpty)
            {
              return 'pleaseMealDescription'.tr(context);
            }
            else
            {
              return null;
            }
          },
        ));
  }
}
