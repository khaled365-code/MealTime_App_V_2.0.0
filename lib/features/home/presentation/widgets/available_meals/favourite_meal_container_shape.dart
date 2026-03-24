

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';


class AddMealContainerShapeToFavourites extends StatelessWidget {
  const AddMealContainerShapeToFavourites({
    super.key, required this.isActivated,
  });
  final bool isActivated;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.transparent,
      ),
      child: Center(
          child: isActivated==true?
          SvgPicture.asset(
          ImageConstants.fontAwesomeHeartIcon,
          colorFilter: ColorFilter.mode(Colors.redAccent,BlendMode.srcIn),width: 20.w,height: 20.h):
        SvgPicture.asset(
            ImageConstants.heartRegularIcon,width: 20.w,height: 20.h,)
      ),
    );
  }
}
