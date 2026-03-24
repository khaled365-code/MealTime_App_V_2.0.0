

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import 'package:new_meal_time_app/core/utils/app_assets.dart';
import 'package:new_meal_time_app/core/utils/app_colors.dart';
import 'package:new_meal_time_app/core/utils/app_text_styles.dart';
import 'package:new_meal_time_app/core/widgets/space_widget.dart';

class OpenCameraOrGalleryContainer extends StatelessWidget {
  const OpenCameraOrGalleryContainer({super.key, this.onGalleryTap, this.onCameraTap});

  final Function()? onGalleryTap;
  final Function()? onCameraTap;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
          height: 190.h,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 60.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xfff09147),
                          Color(0xffebb551),
                        ],
                      begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter

                    )
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 15.w,top: 15.h),
                  child: Text('completeActionUsing'.tr(context),style: AppTextStyles.bold18(context).copyWith(color: AppColors.white),),
                ),
              ),

              Container(
                width: double.infinity,
                height: 130.h,
                decoration: BoxDecoration(
                  color: AppColors.cFFE6CA,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap:onGalleryTap,
                        child: Container(
                         decoration: BoxDecoration(
                             color: AppColors.white,
                             gradient: LinearGradient(
                                 colors: [
                                   Color(0xffa0b09d),
                                   Color(0xff628e9c),
                                 ],
                                 begin: AlignmentDirectional.topCenter,
                                 end: AlignmentDirectional.bottomCenter
                             )
                         ),
                          child: Column(
                            children: [
                              SpaceWidget(height: 20,),
                              SizedBox(
                                width: 50.w,
                                  height: 50.h,
                                  child: Image.asset(ImageConstants.galleryAndroidImage)),
                              SpaceWidget(height: 7,),
                              Text('gallery'.tr(context),style: AppTextStyles.regular16(context).copyWith(color: AppColors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: onCameraTap,
                        child: Container(
                          decoration:  BoxDecoration(
                            color: AppColors.white,
                          ),
                          child: Column(
                            children:
                            [
                              SpaceWidget(height: 20,),
                              SizedBox(
                                  width: 50.w,
                                  height: 50.h,
                                  child: Image.asset(ImageConstants.cameraAndroidImage)),
                              SpaceWidget(height: 7,),
                              Text('camera'.tr(context),style: AppTextStyles.regular16(context).copyWith(color: AppColors.black),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ],
          ),

        ),
      ],
    );
  }
}
