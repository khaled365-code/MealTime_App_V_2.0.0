

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class OtpCodeContainer extends StatelessWidget {
  const OtpCodeContainer({super.key, required this.singleContainerController});


  final TextEditingController singleContainerController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      child: TextFormField(
        controller: singleContainerController,
        cursorColor: AppColors.c1E1E2E,
        keyboardType: TextInputType.number,
        onChanged: (value)
        {
          if(value.length==1)
            {
              FocusScope.of(context).nextFocus();
            }
        },
        validator: (value)
        {
          if(value!.isEmpty)
            {
              return 'empty'.tr(context);
            }
          else
            {
              return null;
            }
        },
        style: AppTextStyles.bold16(context).copyWith(color: AppColors.c32343E),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
           FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
            fillColor:  AppColors.cF0F5FA ,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.transparent),
            ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.transparent),

          )
        ),
      ),
    );
  }
}
