

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';
import 'grid_shimmer_meal_item.dart';

class AllAvailableMealsLoadingWidget extends StatelessWidget {
  const AllAvailableMealsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 24.w),
            child: Text('mealsISLoading'.tr(context),
                style: AppTextStyles.regular20(context).copyWith(
                    color: AppColors.c181C2E
                )),
          ),
          SpaceWidget(height: 24,),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => GridShimmerMealItem(),
            itemCount: 12,
            padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 21,
                crossAxisSpacing: 21,
                childAspectRatio: 153/172
            ),
          ),
        ],
      ),
    );
  }
}
