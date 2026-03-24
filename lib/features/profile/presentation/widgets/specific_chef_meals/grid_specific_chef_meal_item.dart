

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../data/models/specific_chef_meals_model/chef_meals.dart';
import '../../cubits/get_specific_chef_meals_cubit/get_specific_chef_meals_cubit.dart';

class GridSpecificChefMealsItem extends StatelessWidget {
  const GridSpecificChefMealsItem({super.key, required this.meal});

  final SpecificChefMeals meal;


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
                padding:  EdgeInsetsDirectional.only(start: 10.w,end: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(flex: 5,),
                    meal.name!.contains(' ')?
                    Column(
                      children:
                      [
                        FittedBox(
                               fit: BoxFit.scaleDown,
                               child: Text(meal.name!.split(' ').first,
                                   style: AppTextStyles.semiBold22(context).copyWith(
                                       color: AppColors.c32343E
                                   )),
                             ),
                        Text(
                            meal.name!.split(' ').last,
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                            style: AppTextStyles.semiBold22(context).copyWith(
                                color: AppColors.c32343E
                            )),
                           ],
                        ):
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(meal.name!,
                          style: AppTextStyles.semiBold22(context).copyWith(
                              color: AppColors.c32343E
                          )),
                    ),
                    SpaceWidget(height: 18,),
                    isArabic()==false?
                    Text('\$${meal.price}'.toString(), style: AppTextStyles
                        .bold17(context).copyWith(
                        color: AppColors.cFA4A0C
                    )):
                    Text('${translateNumbersToArabic(meal.price)}\$', style: AppTextStyles
                        .bold17(context).copyWith(
                        color: AppColors.cFA4A0C
                    )),
                    Spacer(),

                  ],
                ),
              ),
            ),
            PositionedDirectional(
              top: -50.5.h,
              start: 12.w,
              end: 14.w,
              child: Container(
                width: 129.w,
                height: 129.h,
                decoration:
                BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            meal.images!.isNotEmpty? meal.images!.first :'https://tse4.mm.bing.net/th?id=OIP.Sas1lt6Xn5FvmEKI0lJaLAHaHa&pid=Api&P=0&h=220'
                        ), fit: BoxFit.fill)
                )
                ),
            ),
          ],
        );
      },
    );
  }
}
