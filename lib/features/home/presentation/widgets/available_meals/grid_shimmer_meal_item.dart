

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/space_widget.dart';

class GridShimmerMealItem extends StatelessWidget {
  const GridShimmerMealItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.c96969A,
                blurRadius: 30,
                offset: const Offset(12, 12),
                spreadRadius: 0
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 10.w,end: 10.w,top: 5.h),
            child: Container(
              height: 84.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                      image: AssetImage(
                          ImageConstants.noImage
                      ),fit: BoxFit.fill)
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsetsDirectional.only(start: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 3,),
                  Shimmer.fromColors(
                    baseColor: AppColors.white,
                    highlightColor: AppColors.cD1D8E0,
                    child: Container(
                      height: 15.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  ImageConstants.loadingImage
                              ),fit: BoxFit.fill)
                      ),
                    ),
                  ),
                  SpaceWidget(height: 5,),
                  Shimmer.fromColors(
                    baseColor: AppColors.white,
                    highlightColor: AppColors.cD1D8E0,
                    child: Container(
                      height: 15.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  ImageConstants.loadingImage
                              ),fit: BoxFit.fill)
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Shimmer.fromColors(
                          baseColor: AppColors.white,
                          highlightColor: AppColors.cD1D8E0,
                          child: Container(
                            height: 20.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        ImageConstants.loadingImage
                                    ),fit: BoxFit.fill)
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Shimmer.fromColors(
                        baseColor: AppColors.white,
                        highlightColor: AppColors.cD1D8E0,
                        child: Padding(
                          padding:  EdgeInsetsDirectional.only(end: 10.w),
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                ImageConstants.heartRegularIcon,
                                width: 20.w,
                                height: 20.h,
                                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),)
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(flex: 4,),
            
                ],
              ),
            ),
          ),




        ],
      ),
    );
  }
}
