
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../cubits/get_specific_chef_meals_cubit/get_specific_chef_meals_cubit.dart';

class GridShimmerChefMealItem extends StatelessWidget {
  const GridShimmerChefMealItem({super.key});



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<GetSpecificChefMealsCubit, GetSpecificChefMealsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 156.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.cF3F3F3,
                  boxShadow:
                  [
                    BoxShadow(
                      spreadRadius: 0,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2,
                    )
                  ]
              ),
              child: Padding(
                padding:  EdgeInsetsDirectional.only(start: 16.5.w,end: 29.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(flex: 5,),
                    Shimmer.fromColors(
                      baseColor: AppColors.white,
                      highlightColor: AppColors.cD1D8E0,
                      child: Container(
                        height: 25.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(ImageConstants.loadingImage,),fit: BoxFit.fill)
                        ),
                      ),
                    ),
                    SpaceWidget(height: 18,),
                    Shimmer.fromColors(
                      baseColor: AppColors.white,
                      highlightColor: AppColors.cD1D8E0,
                      child: Container(
                        height: 25.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(ImageConstants.loadingImage),fit: BoxFit.fill)
                        ),
                      ),
                    ),
                    Spacer(),

                  ],
                ),
              ),
            ),
            PositionedDirectional(
              top: -50.5.h,
              start: 12.w,
              end: 14.w,
              child: Shimmer.fromColors(
                baseColor: AppColors.white,
                highlightColor: AppColors.cD1D8E0,
                child: Container(
                    width: 129.w,
                    height: 129.h,
                    decoration:
                    BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                ImageConstants.userDefaultImage
                            ), fit: BoxFit.fill)
                    )
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
