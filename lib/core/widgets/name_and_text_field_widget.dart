

import 'package:flutter/material.dart';
import 'package:new_meal_time_app/core/utils/app_text_styles.dart';
import 'package:new_meal_time_app/core/widgets/space_widget.dart';


class NameAndTextFieldWidget extends StatelessWidget {
  const NameAndTextFieldWidget({super.key, required this.title, required this.childWidget});

  final String title;
  final Widget childWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTextStyles.regular13(context).copyWith(color: Color(0xff32343E)),),
        SpaceWidget(height: 8,),
        childWidget
      ],
    );
  }
}
