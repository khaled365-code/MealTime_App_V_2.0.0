
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/commons/global_cubits/internet_checking_cubit.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class PersonalAndEditProfileBodyContainer extends StatelessWidget {
  const PersonalAndEditProfileBodyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(20.w),
      decoration: BoxDecoration(
          color: AppColors.cF6F8FA,
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            onTap: ()
            {
              navigate(context: context, route: Routes.personalInfoScreen);
            },
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Center(child: SvgPicture.asset(ImageConstants.personProfileIcon),),
            ),
            title: Text('personalInfo'.tr(context),style: AppTextStyles.regular16(context).copyWith(color: AppColors.c32343E,)),
            trailing:
                isArabic() == false?
                SvgPicture.asset(ImageConstants.arrowNextProfileIcon):
                Transform.rotate(
                 angle: 3.14159,
                child: SvgPicture.asset(ImageConstants.arrowNextProfileIcon)),
          ),
          SpaceWidget(height: 16,),
          ListTile(
            contentPadding: EdgeInsetsDirectional.zero,
            onTap: ()
            {
              navigate(context: context, route: Routes.editProfileScreen);
            },
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding:  EdgeInsets.all(11.w),
                child: SvgPicture.asset(
                  ImageConstants.userProfileIcon,
                  colorFilter: ColorFilter.mode(AppColors.c413DFB, BlendMode.srcIn),),
              ),
            ),
            title: Text('editProfile'.tr(context),style: AppTextStyles.regular16(context).copyWith(color: AppColors.c32343E,)),
            trailing:
            isArabic() == false?
            SvgPicture.asset(ImageConstants.arrowNextProfileIcon):
            Transform.rotate(
                angle: 3.14159,
                child: SvgPicture.asset(ImageConstants.arrowNextProfileIcon)),
          ),

        ],
      ),
    );
  }
}