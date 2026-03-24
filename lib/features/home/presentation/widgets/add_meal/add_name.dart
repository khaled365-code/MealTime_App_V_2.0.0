

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/add_meal_cubit/add_meal_cubit.dart';

class AddMealNameTextField extends StatelessWidget {
  const AddMealNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'mealName'.tr(context),
        childWidget: CustomOutlineTextField(
          maxLines: 1,
          inputFormatters:
          [
            LengthLimitingTextInputFormatter(30)
          ],
          controller: AddMealCubit.get(context).mealNameController,
          hintText: 'writeMealName'.tr(context),
          onFieldSubmitted: (value)
          {

          },
          validator: (value)
          {
            if(value!.isEmpty)
            {
              return 'pleaseMealName'.tr(context);
            }
            if(value==' ')
              {
                return 'pleaseMealName'.tr(context);
              }
            else
            {
              return null;
            }
          },
          keyboardType: TextInputType.text,
        ));
  }
}
