



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class PersonalInfoContainer2 extends StatelessWidget {
  const PersonalInfoContainer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(20.w),
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
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.all(11.w),
                child: SvgPicture.asset(ImageConstants.brandNameIcon,colorFilter: ColorFilter.mode(AppColors.cFFAA2A, BlendMode.srcIn),),),
            ),
            title: Text('brandName'.tr(context).toUpperCase(),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E,)),
            subtitle: FittedBox(
              alignment: AlignmentDirectional.centerStart,
                fit: BoxFit.scaleDown,
                child: Text(CacheHelper().getData(key: ApiKeys.brandName),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c6B6E82,))),
          ),

          SpaceWidget(height: 16,),
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.all(11.w),
                child: SvgPicture.asset(ImageConstants.minimumChargeIcon,colorFilter: ColorFilter.mode(AppColors.c2AE1E1, BlendMode.srcIn),)),
            ),
            title: Text('minCharge'.tr(context).toUpperCase(),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E,)),
            subtitle: Text(CacheHelper().getData(key: ApiKeys.minCharge).toString(),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c6B6E82,)),
          ),


          SpaceWidget(height: 16,),
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.all(11.w),
                child: SvgPicture.asset(ImageConstants.descIcon,colorFilter: ColorFilter.mode(AppColors.cFB4A59, BlendMode.srcIn),)),),
            title: Text('brandDesc'.tr(context).toUpperCase(),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E,)),
            subtitle: FittedBox(
                alignment: AlignmentDirectional.centerStart,
                fit: BoxFit.scaleDown,
                child: Text(CacheHelper().getData(key: ApiKeys.description),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c6B6E82,))),
          ),
          CacheHelper().getData(key: ApiKeys.userAddress)!=null &&
          CacheHelper().getData(key: ApiKeys.userAddress)!=''?
          Column(
            children: [
              SpaceWidget(height: 16,),
              ListTile(
                contentPadding: EdgeInsetsDirectional.zero,
                leading: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                      padding: EdgeInsetsDirectional.all(11.w),
                      child: SvgPicture.asset(ImageConstants.descIcon,colorFilter: ColorFilter.mode(AppColors.cFB4A59, BlendMode.srcIn),)),),
                title: Text('address'.tr(context).toUpperCase(),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E,)),
                subtitle: Text(
                    CacheHelper().getData(key: ApiKeys.userAddress),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c6B6E82,)),),
            ],
          ):SizedBox.shrink(),
          SpaceWidget(height: 16,),
          ListTile(
            onTap: ()
            {
              navigate(context: context, route: Routes.certificationScreen);
            },
            contentPadding: EdgeInsetsDirectional.zero,
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                  padding: EdgeInsetsDirectional.all(10.w),
                  child: SvgPicture.asset(ImageConstants.certificateIcon,colorFilter: ColorFilter.mode(AppColors.cFB4A59, BlendMode.srcIn),)),),
            title: Text('healthCertificate'.tr(context).toUpperCase(),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c32343E,)),
            subtitle: Text('clickToSee'.tr(context),style: AppTextStyles.regular14(context).copyWith(color: AppColors.c6B6E82,)),
          ),









        ],
      ),
    );
  }
}
