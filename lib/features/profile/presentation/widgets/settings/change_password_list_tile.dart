



import 'package:flutter/material.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import 'change_password_bottom_sheet.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ChangePasswordListTile extends StatelessWidget {
  const ChangePasswordListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async
      {
          showModalBottomSheet(
          backgroundColor: AppColors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (context) => ChangePasswordBottomSheet(),);

      },
      title: Text('changePassword'.tr(context),style: AppTextStyles.bold15(context).copyWith(
          color: AppColors.c32343E
      ),),
      subtitle: Text('allowsChangePassword'.tr(context),style: AppTextStyles.regular13(context).copyWith(
          color: AppColors.cA0A5BA
      ),),
      contentPadding: EdgeInsetsDirectional.zero,
    );
  }
}
