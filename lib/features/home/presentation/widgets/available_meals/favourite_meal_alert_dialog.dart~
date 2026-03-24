

import 'package:flutter/material.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../data/models/get_meals_model/system_all_meals.dart';

class AddMealToFavouritesAlertDialog extends StatelessWidget {
  const AddMealToFavouritesAlertDialog({
    super.key,
    required this.meal
  });

  final SystemMeals meal;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text('Favourites',
            style: AppTextStyles.bold18(context)
                .copyWith(
                color: AppColors.c32343E
            )),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('You want to',
              style: AppTextStyles.regular16(context)
                  .copyWith(
                  color: AppColors.c646982
              )),
          SpaceWidget(height: 5,),
          Text(
              'add this meal to favourites ?',
              style: AppTextStyles.regular16(context)
                  .copyWith(
                  color: AppColors.c646982
              )),
          SpaceWidget(height: 20,),
        ],
      ),
    );
  }
}

