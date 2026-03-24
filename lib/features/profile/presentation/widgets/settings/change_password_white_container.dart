


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ChangePasswordWhiteContainer extends StatelessWidget {
  const ChangePasswordWhiteContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsetsDirectional.only(start: 15.w),
      decoration: BoxDecoration(
        color: AppColors.cFAFAFA,
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          'changePassword'.tr(context), style: AppTextStyles.bold18(
            context).copyWith(color: AppColors.c181C2E),),
      ),
    );
  }
}
