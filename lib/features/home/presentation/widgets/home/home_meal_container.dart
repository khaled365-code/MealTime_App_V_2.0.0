


import 'package:cached_network_image/cached_network_image.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../data/models/get_meals_model/system_all_meals.dart';


class HomeMealContainer extends StatelessWidget {
  const HomeMealContainer({super.key, required this.meal});

  final SystemMeals meal;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 327/137,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: meal.images!.first.isNotEmpty?
                DecorationImage(
                    image: CachedNetworkImageProvider(
                      meal.images!.first,
                    ),fit: BoxFit.fill):null
              ),),
          ),
          SpaceWidget(height: 8,),
          Text(meal.name!,style: AppTextStyles.regular20(context).copyWith(
            color: AppColors.c181C2E
          ),),
          SpaceWidget(height: 5,),
          Text(meal.description!,style: AppTextStyles.regular14(context).copyWith(
              color: AppColors.cA0A5BA
          ),),
          SpaceWidget(height: 16,),
          Row(
            children: [
              SvgPicture.asset(ImageConstants.priceIcon,colorFilter: ColorFilter.mode(AppColors.cFF7622, BlendMode.srcIn),),
              SpaceWidget(width: 9,),
              isArabic()==false?
              Text(meal.price.toString(),style: AppTextStyles.bold16(context).copyWith(
                  color: AppColors.c181C2E
              ),):
              Text(translateNumbersToArabic(meal.price),style: AppTextStyles.bold16(context).copyWith(
                  color: AppColors.c181C2E
              ),),
              Spacer(),
              SvgPicture.asset(ImageConstants.categoryIcon,colorFilter: ColorFilter.mode(AppColors.cFF7622, BlendMode.srcIn),),
              SpaceWidget(width: 9,),
              Text('${meal.category}'.tr(context),style: AppTextStyles.regular14(context).copyWith(
                  color: AppColors.c181C2E
              ),),
              Spacer(),
              SvgPicture.asset(ImageConstants.userChefIcon,colorFilter: ColorFilter.mode(AppColors.cFF7622, BlendMode.srcIn),),
              SpaceWidget(width: 9,),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  meal.chefId!.brandName!,style: AppTextStyles.regular14(context).copyWith(
                    color: AppColors.c181C2E
                ),),
              ),
              Spacer(),
            ],
          )




        ],
      ),
    );
  }
}
