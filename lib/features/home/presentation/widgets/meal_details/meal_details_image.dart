

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/get_meals_model/system_all_meals.dart';

class MealDetailsImage extends StatelessWidget {
  const MealDetailsImage({
    super.key,
    required this.receivedMeal,
  });

  final SystemMeals receivedMeal;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 327/184,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.r),
            image: receivedMeal.images!.first.isEmpty? null:
            DecorationImage(
                image: CachedNetworkImageProvider(
                    receivedMeal.images!.first
                ),fit: BoxFit.fill)
        ),
      ),
    );
  }
}
