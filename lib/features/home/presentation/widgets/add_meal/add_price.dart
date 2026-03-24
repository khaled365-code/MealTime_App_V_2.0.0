

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/add_meal_cubit/add_meal_cubit.dart';

class AddMealPriceTextField extends StatelessWidget {
  const AddMealPriceTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'mealPrice'.tr(context),
        childWidget: CustomOutlineTextField(
          controller: AddMealCubit.get(context).mealPriceController,
          hintText: 'writeMealPrice'.tr(context),
          maxLines: 1,
          inputFormatters:
          [
            FilteringTextInputFormatter.digitsOnly,
          ],
          validator: (value) {
            if(value!.isEmpty)
            {
              return 'pleaseMealPrice'.tr(context);
            }
            else
            {
              return null;
            }
          },
          keyboardType: TextInputType.number,
        ));
  }
}
