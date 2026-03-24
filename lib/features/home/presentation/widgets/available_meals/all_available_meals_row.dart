

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';


class AllAvailableMealsText extends StatelessWidget {
  const AllAvailableMealsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24.w),
      child: Text('popularMeals'.tr(context),
          style: AppTextStyles.regular20(context).copyWith(
              color: AppColors.c181C2E
          )),
    );
  }
}
