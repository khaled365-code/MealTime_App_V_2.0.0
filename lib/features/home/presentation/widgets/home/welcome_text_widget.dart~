

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';


class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24.w),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.centerStart,
        child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text: 'hey'.tr(context),
                    style: AppTextStyles.regular16(context)
                        .copyWith(color: AppColors.c1E1D1D),
                  ),
                  TextSpan(
                    text: ' ${CacheHelper().getData(
                        key: ApiKeys.name)}' ,
                    style: AppTextStyles.regular16(context)
                        .copyWith(color: AppColors.c1E1D1D),
                  ),
                  TextSpan(
                    text: ' ${getCurrentGreetingTime(context)} !',
                    style: AppTextStyles.bold16(context).copyWith(
                        color: AppColors.c1E1D1D),
                  )
                ]
            )),
      ),
    );
  }
}
