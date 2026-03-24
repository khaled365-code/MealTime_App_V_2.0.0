

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/services/internet_connection_service.dart';
import '../../../../../core/widgets/no_internet_connection_dialog.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../cubits/change_password_cubit/change_password_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ChangePasswordButtonsRow extends StatelessWidget {
  const ChangePasswordButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: BorderSide(color: AppColors.cD2D2D2),
                ),
                fixedSize: Size(0, 40.h),
              ),
              onPressed: ()
              {
                Navigator.pop(context);
              },
              child: FittedBox(
                fit: BoxFit.scaleDown,
                  child: Text('cancel'.tr(context),
                style: AppTextStyles.bold16(context).copyWith(
                    color: AppColors.c181C2E),))),
        ),
        SpaceWidget(width: 10,),
        Expanded(
          flex: 2,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: BorderSide(color: AppColors.transparent),
                ),
                fixedSize: Size(0, 40.h),
              ),
              onPressed: () async
              {
                if( await InternetConnectionCheckingService.checkInternetConnection()==true)
                  {
                    if(ChangePasswordCubit.get(context).changePasswordFormKey.currentState!.validate())
                    {
                      ChangePasswordCubit.get(context).changePasswordFormKey.currentState!.save();
                      ChangePasswordCubit.get(context).changePasswordFun(
                          oldPassword: ChangePasswordCubit.get(context).oldPasswordController.text,
                          newPassword: ChangePasswordCubit.get(context).newPasswordController.text,
                          confirmPassword: ChangePasswordCubit.get(context).confirmPasswordController.text);
                    }
                    else
                    {
                      ChangePasswordCubit.get(context).activateChangePasswordAutoValidateMode();
                    }
                  }
                else
                  {
                    showDialog(context: context, builder: (context) => NoInternetConnectionDialog(),);
                  }

              },
              child: FittedBox(
                fit: BoxFit.scaleDown,
                  child: Text('changePassword'.tr(context),
                style: AppTextStyles.bold16(context).copyWith(
                    color: AppColors.white),))),
        )

      ],
    );
  }
}
