import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../data/models/get_meals_model/system_all_meals.dart';
import '../widgets/meal_details/details_screen_app_bar.dart';
import '../widgets/meal_details/meal_details_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var receivedMeal =
        ModalRoute.of(context)!.settings.arguments as SystemMeals;
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceWidget(
                      height: 32,
                    ),
                    DetailsScreenAppBar(),
                    SpaceWidget(
                      height: 44,
                    ),
                    MealDetailsImage(receivedMeal: receivedMeal),
                    SpaceWidget(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receivedMeal.name!,
                          style: AppTextStyles.bold20(context)
                              .copyWith(color: AppColors.c181C2E),
                        ),
                        SpaceWidget(
                          height: 4,
                        ),
                        Text(
                          receivedMeal.description!,
                          style: AppTextStyles.regular14(context)
                              .copyWith(color: AppColors.cA0A5BA),
                        ),
                        SpaceWidget(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              ImageConstants.priceIcon,
                              colorFilter: ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn),
                            ),
                            SpaceWidget(
                              width: 10,
                            ),
                            isArabic() == false
                                ? Text(
                                    receivedMeal.price.toString(),
                                    style: AppTextStyles.bold16(context)
                                        .copyWith(color: AppColors.c181C2E),
                                  )
                                : Text(
                                    translateNumbersToArabic(
                                        receivedMeal.price),
                                    style: AppTextStyles.bold16(context)
                                        .copyWith(color: AppColors.c181C2E),
                                  ),
                            Spacer(),
                            SvgPicture.asset(
                              ImageConstants.categoryIcon,
                              colorFilter: ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn),
                            ),
                            SpaceWidget(
                              width: 10,
                            ),
                            Text(
                              receivedMeal.category!.tr(context),
                              style: AppTextStyles.regular14(context)
                                  .copyWith(color: AppColors.c181C2E),
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              ImageConstants.userChefIcon,
                              colorFilter: ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn),
                            ),
                            SpaceWidget(
                              width: 10,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                receivedMeal.chefId!.brandName!,
                                style: AppTextStyles.regular14(context)
                                    .copyWith(color: AppColors.c181C2E),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SpaceWidget(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              ImageConstants.timeIcon,
                              colorFilter: ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn),
                            ),
                            SpaceWidget(
                              width: 10,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'createdAt'.tr(context),
                                style: AppTextStyles.regular14(context)
                                    .copyWith(color: AppColors.c32343E),
                              ),
                              TextSpan(
                                text: isArabic() == false
                                    ? ' ${formatDate(dateTime: DateTime.parse(receivedMeal.createdAt!), context: context)}'
                                    : ' ${translateNumbersToArabic(formatDate(dateTime: DateTime.parse(receivedMeal.createdAt!), isArabic: true, context: context))}',
                                style: AppTextStyles.regular16(context)
                                    .copyWith(color: AppColors.c121223),
                              ),
                              TextSpan(
                                text: isArabic() == false
                                    ? ' at ${formatClock(dateTime: DateTime.parse(receivedMeal.createdAt!))}'
                                    : ' عند ${translateNumbersToArabic(formatClock(dateTime: DateTime.parse(receivedMeal.createdAt!), isArabic: true))}',
                                style: AppTextStyles.regular16(context)
                                    .copyWith(color: AppColors.c121223),
                              ),
                              TextSpan(
                                text:
                                    ' ${getAmorPm(DateTime.parse(receivedMeal.createdAt!), context)}',
                                style: AppTextStyles.regular16(context)
                                    .copyWith(color: AppColors.c121223),
                              )
                            ])),
                          ],
                        ),
                        SpaceWidget(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              ImageConstants.timeIcon,
                              colorFilter: ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn),
                            ),
                            SpaceWidget(
                              width: 10,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'updatedAt'.tr(context),
                                style: AppTextStyles.regular14(context)
                                    .copyWith(color: AppColors.c32343E),
                              ),
                              TextSpan(
                                text: isArabic() == false
                                    ? ' ${formatDate(dateTime: DateTime.parse(receivedMeal.updatedAt!), context: context)}'
                                    : ' ${translateNumbersToArabic(formatDate(dateTime: DateTime.parse(receivedMeal.updatedAt!), isArabic: true, context: context))}',
                                style: AppTextStyles.regular16(context)
                                    .copyWith(color: AppColors.c121223),
                              ),
                              TextSpan(
                                text: isArabic() == false
                                    ? ' at ${formatClock(dateTime: DateTime.parse(receivedMeal.updatedAt!))}'
                                    : ' عند ${translateNumbersToArabic(formatClock(dateTime: DateTime.parse(receivedMeal.updatedAt!), isArabic: true))}',
                                style: AppTextStyles.regular16(context)
                                    .copyWith(color: AppColors.c121223),
                              ),
                              TextSpan(
                                text:
                                    ' ${getAmorPm(DateTime.parse(receivedMeal.updatedAt!), context)}',
                                style: AppTextStyles.regular16(context)
                                    .copyWith(color: AppColors.c121223),
                              )
                            ])),
                          ],
                        ),
                      ],
                    ),
                    SpaceWidget(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                color: AppColors.cF0F5FA,
                child: Column(
                  children: [
                    Expanded(
                        child: SpaceWidget(
                      height: 92,
                    )),
                    /* SharedButton(
                        btnText: 'updateThisMeal'.tr(context),
                        btnTextStyle: AppTextStyles.bold16(context).copyWith(
                            color: AppColors.white
                        ),
                        onPressed: () async
                        {
                          navigate(context: context, route: Routes.updateMealScreen,arg: receivedMeal);
                        },),*/
                    SpaceWidget(
                      height: 32,
                    )
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
