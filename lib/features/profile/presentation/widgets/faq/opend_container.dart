

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../data/models/faq_screen_models/questions_and_answers_model.dart';

class OpenedContainer extends StatefulWidget {
  const OpenedContainer({super.key, required this.questionsAndAnswersModel});

  final QuestionsAndAnswersModel questionsAndAnswersModel;

  @override
  State<OpenedContainer> createState() => _OpenedContainerState();
}

class _OpenedContainerState extends State<OpenedContainer> {
  bool containerIsOpen=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
       containerIsOpen=!containerIsOpen;
       setState(() {

       });
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(top: 16.h,start: 16.w,bottom: 11.h,end: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.transparent,
          border: Border.all(
            color: AppColors.cD9D9D9,
            width: 2.w
          )
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.questionsAndAnswersModel.question.tr(context),
                  style: AppTextStyles.bold14(context).copyWith(
                    color: AppColors.c1E1E2E
                  ),),
                Spacer(),
               containerIsOpen==false? Icon(Icons.add,color: AppColors.primaryColor,):Icon(Icons.remove,color: AppColors.primaryColor,)
              ],
            ),
            containerIsOpen==true?
             Column(
               children: [
                 SpaceWidget(height: 8,),
                 Text(widget.questionsAndAnswersModel.answer.tr(context),
                 style: AppTextStyles.regular14(context).copyWith(color: AppColors.c757575),)
               ],
             ):SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
