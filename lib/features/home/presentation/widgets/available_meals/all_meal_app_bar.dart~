

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/routes/routes.dart';
import '../../cubits/favourites_and_history_cubit/favourites_and_history_cubit.dart';
import '../../cubits/get_system_meals_cubit/system_meals_cubit.dart';

class AllMealsAppBar extends StatelessWidget {
  const AllMealsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cECF0F4
              ),
              child:
              isArabic()==false?
              Center(
                child: SvgPicture.asset(
                width: 8,
                    ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)),
            ):
              Center(
                child: Transform.rotate(
                  angle: 3.14159,
                  child: SvgPicture.asset(
                      width: 8,
                      ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)),
                ),
              ),
          )),
          Spacer(),
          GestureDetector(
            onTap: () async
            {
              if(SystemMealsCubit.get(context).allMealsModel?.meals!=null)
                {
                  for (int i = 0; i < SystemMealsCubit.get(context).allMealsModel!.meals!.length; i++)
                  {
                    if (SystemMealsCubit.get(context).allMealsModel!.meals![i].itemIsSelected == true)
                      {
                       await FavouritesAndHistoryCubit.get(context).saveFavouriteMealToCache(SystemMealsCubit.get(context).allMealsModel!.meals!, i);
                      }
                  }
                }
             else if (SystemMealsCubit.get(context).cachedSystemMeals!=null)
                {
                  for (int i=0;i<SystemMealsCubit.get(context).cachedSystemMeals!.length;i++)
                    {
                      if(SystemMealsCubit.get(context).cachedSystemMeals![i].itemIsSelected==true)
                        {
                          await FavouritesAndHistoryCubit.get(context).saveFavouriteMealToCache(SystemMealsCubit.get(context).cachedSystemMeals!, i);
                        }
                    }
                }
              FavouritesAndHistoryCubit.get(context).getCachedFavouriteMeals();
              navigate(context: context, route: Routes.favouritesScreen,arg: FavouritesAndHistoryCubit.get(context));

            },
            child: Container(
              width: 45.w,
              height: 49.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.c181C2E
              ),
              child: Center(
                  child: Icon(Icons.favorite_outline_rounded, color: AppColors.white,)),
            ),
          ),
        ],
      ),
    );
  }
}
