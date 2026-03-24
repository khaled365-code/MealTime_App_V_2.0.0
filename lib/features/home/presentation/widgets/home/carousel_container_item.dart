

import 'package:new_meal_time_app/core/localization/app_localization.dart';
import 'package:new_meal_time_app/core/localization/localization_cubit/localization_cubit.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../data/models/carousel_slider_data_model/carousel_slider_model.dart';

class CarouselContainerItem extends StatelessWidget {
  const CarouselContainerItem({super.key, required this.carouselSliderModel, required this.index});

  final CarouselSliderModel carouselSliderModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors:
            [
              AppColors.primaryColor,
              AppColors.c114494
            ],
            begin: AlignmentDirectional.topCenter,
            end:AlignmentDirectional.bottomCenter ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding:  EdgeInsetsDirectional.only(start: 10.w,top: 20.h,end: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(carouselSliderModel.textTitle.tr(context),style: AppTextStyles.bold16(context).copyWith(color:
                  AppColors.white),),
                  SpaceWidget(height: 20,),
                  /* GestureDetector(
                    onTap: ()
                    {
                      if(index==1)
                        {

                          navigate(context: context,route: Routes.allMealsScreen);
                        }
                      else
                        {
                          navigate(context: context,route: Routes.customDrawerScreen);
                        }
                    },
                    child: Container(
                      width: 150.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        shape: BoxShape.rectangle
                      ),
                      child: Center(child: Text(carouselSliderModel.btnText.tr(context),style: AppTextStyles.bold14(context).copyWith(color: AppColors.primaryColor),)),
                    ),
                  ) */
                ],
              ),
            ),
          ),
          Expanded(
              child: Image.asset(
            height: 430.h,
            ImageConstants.chefImage,fit: BoxFit.fill,)),

          ]
          ));
  }
}
