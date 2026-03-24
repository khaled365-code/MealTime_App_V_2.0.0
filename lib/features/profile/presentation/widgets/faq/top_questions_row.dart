


import 'package:flutter/material.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class TopQuestionsRow extends StatelessWidget {
  const TopQuestionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('topQuestions'.tr(context),style: AppTextStyles.bold17(context).copyWith(
            color: AppColors.c1E1E2E
        ),),
        Spacer(),
        Text('viewAll'.tr(context),style: AppTextStyles.bold14(context).copyWith(
            color: AppColors.primaryColor
        )),
      ],);
  }
}
