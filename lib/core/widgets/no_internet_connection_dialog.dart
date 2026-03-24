

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import 'package:new_meal_time_app/core/utils/app_colors.dart';
import 'package:new_meal_time_app/core/utils/app_text_styles.dart';
import 'package:new_meal_time_app/core/widgets/space_widget.dart';

class NoInternetConnectionDialog extends StatelessWidget {
  const NoInternetConnectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.cF0F0F0,
      contentPadding: EdgeInsetsDirectional.only(start: 3.w,top: 5.h),

      title: Text('noInternetConnection'.tr(context),style: AppTextStyles.bold20(context).copyWith(
        color: AppColors.c181C2E
      ),),

      content: Column(
        mainAxisSize: MainAxisSize.min,
         children:
         [
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: 20.w),
             child: Text('pleaseCheckYourInternet'.tr(context),
             style: AppTextStyles.regular14(context).copyWith(
               color: AppColors.c363636
             ),),
           ),
           SpaceWidget(height: 10,),
           Divider(
             color: AppColors.cD3D3D3,
             thickness: 2,
           ),
         ],
      ),
      actions: [
        GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Center(
            child: Text('ok'.tr(context),style: AppTextStyles.bold20(context).copyWith(
              color: AppColors.primaryColor
            )),
          ),
        )
      ],
    );
  }
}
