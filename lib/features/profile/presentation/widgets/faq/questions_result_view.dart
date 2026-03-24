


import 'package:flutter/material.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../cubits/faq_cubit/faq_cubit.dart';
import 'opend_container.dart';

class FaqQuestionsResultView extends StatelessWidget {
  const FaqQuestionsResultView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FaqCubit.get(context).filteredQuestionsAndAnswersList.length==0?
    Center(
      child: Text(
        'noResultFound'.tr(context),
        style: AppTextStyles.bold17(context).copyWith(
            color: AppColors.c1E1E2E
        ),
      ),
    ) :
    ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => OpenedContainer(
          questionsAndAnswersModel: FaqCubit.get(context).filteredQuestionsAndAnswersList[index],
        ),
        separatorBuilder: (context, index) => SpaceWidget(height: 16,),
        itemCount: FaqCubit.get(context).filteredQuestionsAndAnswersList.length);
  }
}
