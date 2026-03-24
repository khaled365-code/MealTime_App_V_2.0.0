


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../cubits/settings_cubit/settings_cubit.dart';

class BillReminderListTile extends StatelessWidget {
  const BillReminderListTile({
    super.key,
    required this.settingsCubit,
  });

  final SettingsCubit settingsCubit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('billReminder'.tr(context),style: AppTextStyles.bold15(context).copyWith(
          color: AppColors.c32343E
      ),),
      subtitle: Text('allowActivateBillReminder'.tr(context),style: AppTextStyles.regular13(context).copyWith(
          color: AppColors.cA0A5BA
      ),),
      contentPadding: EdgeInsetsDirectional.zero,
      trailing: Switch(
          value: CacheHelper().getData(key: ApiKeys.billReminderIsActive)??
          settingsCubit.isBillReminderActive,
          trackOutlineColor: WidgetStatePropertyAll(
              AppColors.cC4C4C4
          ),
          thumbIcon: WidgetStatePropertyAll(Icon(Icons.circle,color: AppColors.white,size: 31.sp,)),
          activeTrackColor: AppColors.primaryColor,
          inactiveThumbColor: AppColors.white,
          inactiveTrackColor: AppColors.cC4C4C4,
          onChanged: (value) async
          {
            await settingsCubit.onBillReminderSwitched(value: value);
          }),
    );
  }
}
