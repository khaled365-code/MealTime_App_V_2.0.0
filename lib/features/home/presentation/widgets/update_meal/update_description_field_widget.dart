

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/update_meal_cubit/update_meal_cubit.dart';

class UpdateDescriptionField extends StatelessWidget {
  const UpdateDescriptionField({
    super.key,
    required this.updateMealCubit,
  });

  final UpdateMealCubit updateMealCubit;

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'newDescription'.tr(context),
        childWidget: CustomOutlineTextField(
          controller: updateMealCubit.updateMealDescriptionController,
          hintText: 'writeNewMealDescription'.tr(context),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLength: 214,
          maxLines: null,

        ));
  }
}
