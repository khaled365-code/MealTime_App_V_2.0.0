
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/utils/app_colors.dart';
import 'package:new_meal_time_app/core/utils/app_text_styles.dart';


class SharedButton extends StatelessWidget {
  const SharedButton({super.key, required this.btnText, this.btnTextStyle, this.borderRadiusValue, this.btnColor, this.btnSize, this.onPressed, this.customHeight, this.customWidth,});

  final String btnText;
  final TextStyle? btnTextStyle;
  final double? borderRadiusValue;
  final WidgetStateProperty<Color?>? btnColor;
  final WidgetStateProperty<Size?>? btnSize;
  final void Function()? onPressed;
  final double? customHeight;
  final double? customWidth;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: btnSize??WidgetStatePropertyAll(Size((customWidth??327).w,(customHeight??62).h)),
        backgroundColor: btnColor??WidgetStatePropertyAll(AppColors.primaryColor),
        shape: WidgetStatePropertyAll(
           RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue??12).r,

          ),
        )
      ),
        onPressed: onPressed,
        child: Text(btnText,style: btnTextStyle??AppTextStyles.bold14(context).copyWith(
      color: AppColors.white,
    ),));
  }
}
