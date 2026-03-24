


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class PersonalInfoContainer extends StatelessWidget {
  const PersonalInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(20.w) ,
      decoration: BoxDecoration(
          color: AppColors.cF6F8FA,
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Column(
        children:
        [
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                  padding: EdgeInsetsDirectional.all(11.w),
              child: SvgPicture.asset(ImageConstants.personProfileIcon),),
            ),
            title: Text('fullName'.tr(context).toUpperCase(),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E,)),
            subtitle: Text(CacheHelper().getData(key: ApiKeys.name),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c6B6E82,)),
          ),
          SpaceWidget(height: 16,),
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.all(11.w),
                child: SvgPicture.asset(ImageConstants.emailProfileIcon),),
            ),
            title: Text('email'.tr(context).toUpperCase(),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E,)),
            subtitle: FittedBox(
              fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.centerStart,
                child: Text(CacheHelper().getData(key: ApiKeys.email),
                    style: AppTextStyles.regular14(context).copyWith(
                      color: AppColors.c6B6E82,))),
          ),
          SpaceWidget(height: 16,),
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.all(11.w),
                child: SvgPicture.asset(ImageConstants.phoneProfileIcon),),
            ),
            title: Text('phoneNumber'.tr(context).toUpperCase(),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E,)),
            subtitle: Text(CacheHelper().getData(key: ApiKeys.phone),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c6B6E82,)),
          ),









        ],
      ),
    );
  }
}
