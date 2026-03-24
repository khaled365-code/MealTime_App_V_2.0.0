


import 'package:flutter/material.dart';

import '../../cubits/add_meal_cubit/add_meal_cubit.dart';
import '../radio_button_with_text_widget.dart';

class QuantityRadioButton extends StatelessWidget {
  const QuantityRadioButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        AddMealCubit.get(context).changeQuantityRadioValue();
      },
      child: RadioButtonWithTextWidget(
        text: 'quantity',
        containerIsSelected: AddMealCubit.get(context).quantityRadioIsSelected,
      ),
    );
  }
}
