


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../data/models/faq_screen_models/famous_qustions_model.dart';

class FamousQuestionItem extends StatelessWidget {
  const FamousQuestionItem({super.key, required this.famousQuestionsModel});

  final FamousQuestionsModel famousQuestionsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 16.w,top: 16.h,end: 16.w,bottom: 20.h),
      decoration: BoxDecoration(
        color: famousQuestionsModel.questionColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          SvgPicture.asset(famousQuestionsModel.icon),
          SpaceWidget(height: 16,),
          FittedBox(
            fit: BoxFit.scaleDown,
              child: Text('questionsAbout'.tr(context),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c616161),)),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(famousQuestionsModel.questionTitle.tr(context),style: AppTextStyles.bold15(context).copyWith(color: AppColors.c1E1E2E),)),

        ],
      ),
    );
  }
}
