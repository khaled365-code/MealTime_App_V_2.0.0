


import 'package:flutter/material.dart';

import '../../cubits/faq_cubit/faq_cubit.dart';
import 'famous_question_item.dart';

class FaqRowQuestions extends StatelessWidget {
  const FaqRowQuestions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: FaqCubit.get(context).famousQuestions.asMap().entries.map((e)
        {
          var index=e.key;
          var value=e.value;
          return Padding(
            padding:  EdgeInsetsDirectional.only(end: index!=FaqCubit.get(context).famousQuestions.length-1?16:0),
            child: FamousQuestionItem(
                famousQuestionsModel: value),
          );
        },).toList(),),
    );
  }
}
