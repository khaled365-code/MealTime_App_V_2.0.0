

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import 'package:new_meal_time_app/core/localization/localization_cubit/localization_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/line_widget.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../core/widgets/space_widget.dart';


class ChangeLanguageBottomSheet extends StatelessWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r)
             ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpaceWidget(height: 20,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: FittedBox(child: Text('likeChangeAppLanguage'.tr(context),style: AppTextStyles.bold16(context).copyWith(color: AppColors.cA0A5BA),)),
                ),
                Text(
                  isArabic()==false?
                  'toArabic'.tr(context):'toEnglish'.tr(context),style: AppTextStyles.bold16(context).copyWith(color: AppColors.cA0A5BA),),
                SpaceWidget(height: 10,),
                GestureDetector(
                  onTap: () async
                  {
                    if(isArabic()==true)
                    {
                      LocalizationCubit.get(context).changeLanguageToEnglish();
                      Navigator.pop(context);
                    }
                    else
                    {
                      LocalizationCubit.get(context).changeLanguageToArabic();
                      Navigator.pop(context);
                    }

                  },
                  child: Column(
                    children:
                    [
                      LineWidget(
                        height: 3,
                      ),
                      SpaceWidget(height: 20,),
                      Text(
                        isArabic()==false?
                        'changeToArabic'.tr(context):'changeToEnglish'.tr(context),style: AppTextStyles.bold18(context).copyWith(color: AppColors.primaryColor),),
                      SpaceWidget(height: 20,),
                      LineWidget(
                        height: 3,
                      ),
                    ],
                  ),
                ),
                SpaceWidget(height: 20,),
                GestureDetector(
                  onTap: () async
                  {
                   Navigator.pop(context);
                  },
                  child: Column(
                    children:
                    [
                      Text(
                        isArabic()==false?
                        'keepEnglish'.tr(context):'keepArabic'.tr(context),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bold18(context).copyWith(color: AppColors.primaryColor),),
                      SpaceWidget(height: 20,),
                    ],
                  ),
                )








              ],
            ),
          ),
          SpaceWidget(height: 10,),
          SharedButton(
            btnText: 'cancel'.tr(context),
            onPressed: ()
            {
              Navigator.pop(context);
            },
            btnColor: WidgetStatePropertyAll(
              AppColors.white
            ),
            borderRadiusValue: 10,
            btnSize: WidgetStatePropertyAll(
              Size(MediaQuery.sizeOf(context).width, 50.h)
            ),
            btnTextStyle: AppTextStyles.bold20(context).copyWith(
              color: AppColors.primaryColor
            ),
          ),
          SpaceWidget(height: 20,),

        ]),
    );
  }
}
