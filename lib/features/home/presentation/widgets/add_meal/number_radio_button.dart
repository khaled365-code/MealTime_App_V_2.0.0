

import 'package:flutter/material.dart';

import '../../cubits/add_meal_cubit/add_meal_cubit.dart';
import '../radio_button_with_text_widget.dart';

class NumberRadioButton extends StatelessWidget {
  const NumberRadioButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        AddMealCubit.get(context).changeNumberRadioValue();
      },
      child: RadioButtonWithTextWidget(
        text: 'number',
        containerIsSelected: AddMealCubit.get(context).numberRadioIsSelected,
      ),
    );
  }
}
