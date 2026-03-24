

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../data/models/get_meals_model/system_all_meals.dart';
import '../../cubits/favourites_and_history_cubit/favourites_and_history_cubit.dart';
import '../../../../../core/utils/app_text_styles.dart';


class FavouriteMealWidget extends StatelessWidget {
  const FavouriteMealWidget({super.key, required this.meal, required this.ongoingMeal, required this.index,});

  final SystemMeals meal;
  final bool ongoingMeal;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
         Row(
           children: [
             Text(meal.category!.tr(context),style: AppTextStyles.regular14(context).copyWith(
               color: AppColors.c181C2E
             ),),
             SpaceWidget(width: 28,),
             ongoingMeal==true?
             Text('completed'.tr(context),style: AppTextStyles.bold14(context).copyWith(
               color: AppColors.c059C6A
             ),):SizedBox.shrink()
           ],
         ),
         SpaceWidget(height: 16,),
         Divider(
           color: AppColors.cEEF2F6,
           thickness: 2,
         ),
          SpaceWidget(height: 16,),
          Container(
           height: 60.h,
           child:  Row(
             children: [
               Container(
                 width: 60.w,
                 height: 60.h,
                 decoration: BoxDecoration(
                     color: AppColors.c98A8B8,
                     borderRadius: BorderRadius.circular(8.r),
                     image: meal.images!.first.isNotEmpty?
                     DecorationImage(
                         image: CachedNetworkImageProvider(meal.images!.first),
                         fit: BoxFit.fill):null
                 ),
               ),
               SpaceWidget(width: 14,),
               Expanded(
                 child: Padding(
                   padding:  EdgeInsets.only(top: 8.h),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children:
                     [
                       Expanded(
                         child: Row(
                           children: [
                             Text(meal.name!,style: AppTextStyles.bold14(context).copyWith(
                                 color: AppColors.c181C2E
                             ),),
                             Spacer(),
                             Text('#${meal.id!.substring(0,5)}',style: AppTextStyles.regular14(context).copyWith(
                               color: AppColors.c6B6E82))
                           ],
                         ),
                       ),
                       SpaceWidget(height: 10.h,),
                       IntrinsicHeight(
                         child: Row(
                           children: [
                             isArabic()==false?
                             Text('\$${meal.price}',style: AppTextStyles.bold14(context).copyWith(
                                 color: AppColors.c181C2E
                             ),):
                             Text('${translateNumbersToArabic(meal.price)}\$',style: AppTextStyles.bold14(context).copyWith(
                                 color: AppColors.c181C2E
                             ),),
                             ongoingMeal==false?
                             Expanded(
                               child: Row(
                                 children: [
                                   SpaceWidget(width: 10,),
                                   VerticalDivider(
                                     color: AppColors.cCACCDA,
                                     width: 16.w,
                                     thickness: 2,
                                   ),
                                   Spacer(),
                                   RichText(
                                       text:
                                   TextSpan(
                                       children: [
                                         TextSpan(text: isArabic()==false? '${formatDate(dateTime: DateTime.parse(meal.createdAt!),monthName: true,context: context)},':
                                             '${translateNumbersToArabic(formatDate(dateTime: DateTime.parse(meal.createdAt!),monthName: true,isArabic: true,context: context))},',style: AppTextStyles.regular14(context).copyWith(
                                             color: AppColors.c6B6E82
                                         )),
                                         TextSpan(text: isArabic()==false?
                                         ' ${formatClock(dateTime: DateTime.parse(meal.createdAt!))}':
                                         ' ${translateNumbersToArabic(formatClock(dateTime: DateTime.parse(meal.createdAt!),isArabic: true))}',style: AppTextStyles.regular14(context).copyWith(
                                             color: AppColors.c6B6E82
                                         )),
                                       ]
                                   )),
                                   SpaceWidget(width: 8),
                                   Container(
                                     width: 4.w,
                                     height: 4.h,
                                     decoration: BoxDecoration(
                                         color: AppColors.c6B6E82,
                                         shape: BoxShape.circle
                                     ),
                                   )
                                 ],
                               ),
                             ): 
                             SizedBox.shrink()
                           ],
                         ),
                       ),

                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
          SpaceWidget(height: 24,),
          ongoingMeal==true?
          Row(
            children:
            [
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(38.h),
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)
                  )
                ),
                  onPressed: ()
                  {
                    FavouritesAndHistoryCubit.get(context).addToHistoryFavouriteMeal(meal: meal,index: index);
                  },
                  child: Text('addToHistory'.tr(context),style: AppTextStyles.bold12(context).copyWith(
                    color: AppColors.white
                  ),))),
              SpaceWidget(width: 49,),
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromHeight(38.h),
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            side: BorderSide(color: AppColors.primaryColor)
                          )
                      ),
                      onPressed: ()
                      {
                        FavouritesAndHistoryCubit.get(context).removeOngoingFavouriteMeal(meal: meal,index: index);
                      },
                      child: Text('remove'.tr(context),style: AppTextStyles.bold12(context).copyWith(
                          color: AppColors.cFF7622
                      ),)))

            ],
          ):
          SizedBox.shrink()
        ],
      ),
    );
  }
}
