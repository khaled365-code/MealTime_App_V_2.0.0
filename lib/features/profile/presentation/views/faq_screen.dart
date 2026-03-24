import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/faq_cubit/faq_cubit.dart';
import '../widgets/faq/faq_app_bar.dart';
import '../widgets/faq/faq_row_qustions.dart';
import '../widgets/faq/faq_search_field.dart';
import '../widgets/faq/questions_result_view.dart';
import '../widgets/faq/top_questions_row.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    FaqCubit.get(context).initializeList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: CustomScrollView(
            slivers:
            [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                      children: [
                        SpaceWidget(height: 32,),
                        FaqScreenAppBar(),
                        SpaceWidget(height: 31),
                        Text('howCanWeHelp'.tr(context),
                          style: AppTextStyles.bold20(context).copyWith(
                              color: AppColors.c1E1E2E
                          ),),
                        SpaceWidget(height: 25,),
                        FaqSearchField(),
                        SpaceWidget(height: 30,),
                        FaqRowQuestions(),
                        SpaceWidget(height: 40,),
                        TopQuestionsRow(),
                        SpaceWidget(height: 18,),
                        BlocBuilder<FaqCubit, FaqState>(
                          builder: (context, state)
                          {
                            return FaqQuestionsResultView();
                          },
                        ),
                        SpaceWidget(height: 32),

                      ]
                  ),
                ),
              ),
            ],
          )),
    );
  }
}



