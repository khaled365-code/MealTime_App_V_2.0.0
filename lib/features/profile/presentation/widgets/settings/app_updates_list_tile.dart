



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../cubits/settings_cubit/settings_cubit.dart';

class AppUpdatesListTile extends StatelessWidget {
  const AppUpdatesListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsetsDirectional.zero,
      title: Text('appUpdates'.tr(context),style: AppTextStyles.bold15(context).copyWith(
          color: AppColors.c32343E
      ),),
      subtitle: Text('allowGetUpdates'.tr(context),style: AppTextStyles.regular13(context).copyWith(
          color: AppColors.cA0A5BA
      ),),
      trailing: Switch(
          value:
          SettingsCubit.get(context).appUpdateIsActive,
          onChanged: (value)
          {
            SettingsCubit.get(context).switchOnAppUpdatesFun(value: value);
          },
        trackOutlineColor: WidgetStatePropertyAll(
            AppColors.cC4C4C4
        ),
        thumbIcon: WidgetStatePropertyAll(Icon(Icons.circle,color: AppColors.white,size: 31.sp,)),
        activeTrackColor: AppColors.primaryColor,
        inactiveThumbColor: AppColors.white,
        inactiveTrackColor: AppColors.cC4C4C4,
      ),
    );
  }
}
