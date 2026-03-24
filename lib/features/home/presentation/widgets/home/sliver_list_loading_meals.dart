

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_shimmer_container.dart';

class SliverListLoadingMeals extends StatelessWidget {
  const SliverListLoadingMeals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 24.w, end: 24.w, bottom: 28.h),
              child: HomeShimmerContainer(),
            ),
            childCount: 10));
  }
}
