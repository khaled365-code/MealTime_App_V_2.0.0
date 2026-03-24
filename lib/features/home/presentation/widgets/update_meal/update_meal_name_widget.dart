

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/update_meal_cubit/update_meal_cubit.dart';

class UpdateMealNameField extends StatelessWidget {
  const UpdateMealNameField({
    super.key,
    required this.updateMealCubit,
  });

  final UpdateMealCubit updateMealCubit;

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'newName'.tr(context),
        childWidget: CustomOutlineTextField(
          controller: updateMealCubit.updateMealNameController,
          hintText: 'writeNewMealName'.tr(context),
          maxLines: 1,
          inputFormatters:
          [
            LengthLimitingTextInputFormatter(30)
          ],
          keyboardType: TextInputType.text,
        ));
  }
}
