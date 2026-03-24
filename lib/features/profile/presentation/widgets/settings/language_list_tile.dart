

import 'package:flutter/material.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'change_languge_bottom_sheet.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ()
      {
        showModalBottomSheet(
          backgroundColor: AppColors.transparent,
          context: context,
          builder: (context) => ChangeLanguageBottomSheet(),);
      },
      title: Text('language'.tr(context),style: AppTextStyles.bold15(context).copyWith(
          color: AppColors.c32343E
      ),),
      subtitle: Text('allowsLanguageSwitch'.tr(context),style: AppTextStyles.regular13(context).copyWith(
          color: AppColors.cA0A5BA
      ),),
      contentPadding: EdgeInsetsDirectional.zero,
    );
  }
}
