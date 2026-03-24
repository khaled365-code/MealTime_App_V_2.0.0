import 'package:badges/badges.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import '../../cubits/get_system_meals_cubit/system_meals_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24.w),
      child: Row(
        children: [
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () async {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.cECF0F4),
                child: Center(
                  child: SvgPicture.asset(ImageConstants.menuIcon,
                      colorFilter:
                          ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)),
                ),
              ),
            );
          }),
          Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 24.w),
            child: GestureDetector(
              onTap: () async {
                navigate(
                  context: context,
                  route: Routes.allMealsScreen,
                );
              },
              child: Container(
                width: 45.w,
                height: 49.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.c181C2E),
                child: Center(
                    child: badges.Badge(
                  ignorePointer: true,
                  position: BadgePosition.topEnd(top: -28, end: -18),
                  badgeContent: BlocBuilder<SystemMealsCubit, SystemMealsState>(
                    builder: (context, state) {
                      return isArabic() == false
                          ? Text(
                              '${SystemMealsCubit.get(context).allMealsModel?.meals?.length ?? SystemMealsCubit.get(context).cachedSystemMeals?.length ?? 0}',
                              style: AppTextStyles.bold16(context)
                                  .copyWith(color: AppColors.white),
                            )
                          : Text(
                              '${translateNumbersToArabic(SystemMealsCubit.get(context).allMealsModel?.meals?.length ?? SystemMealsCubit.get(context).cachedSystemMeals?.length ?? 0)}',
                              style: AppTextStyles.bold16(context)
                                  .copyWith(color: AppColors.white),
                            );
                    },
                  ),
                  badgeAnimation: BadgeAnimation.scale(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  badgeStyle: BadgeStyle(
                      badgeColor: AppColors.primaryColor,
                      shape: BadgeShape.circle,
                      elevation: 0,
                      padding: EdgeInsetsDirectional.all(10)),
                  child: SvgPicture.asset(
                    ImageConstants.allMealsIcon,
                    colorFilter:
                        ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
