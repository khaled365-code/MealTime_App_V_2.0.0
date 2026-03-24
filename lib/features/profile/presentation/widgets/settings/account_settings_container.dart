

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';
import 'change_password_list_tile.dart';
import 'language_list_tile.dart';

class AccountSettingsContainer extends StatelessWidget {
  const AccountSettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(20.w),
      decoration: BoxDecoration(
          color: AppColors.cF6F8FA,
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'accountSettings'.tr(context),style: AppTextStyles.bold18(context).copyWith(color: AppColors.c181C2E),),
          SpaceWidget(height: 5,),
          LanguageListTile(),
          Divider(
            color: AppColors.cEEF2F6,
            thickness: 4,
            height: 10,
          ),
          ChangePasswordListTile(),
        ],
      ),
    );
  }
}



