
import 'dart:io';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/open_camera_or_gallery_container.dart';
import '../../../../../core/widgets/shared_button.dart';
import '../../../../../core/widgets/space_widget.dart';

class HealthCertificateDotContainer extends StatelessWidget {
  const HealthCertificateDotContainer({super.key, this.onGalleryTap, this.onCameraTap, this.imagePath, this.onDeletePhotoPressed, });

  final void Function()? onGalleryTap;
  final void Function()? onCameraTap;
  final String? imagePath;
  final void Function()? onDeletePhotoPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 24.w),
      child: imagePath!=null?
    Column(
      children: [
        Container(
            height: 200.h,
          decoration: BoxDecoration(
              image: DecorationImage(image: FileImage(File(imagePath!)),fit: BoxFit.fill)
          )),
        SpaceWidget(height: 24.h,),
        SharedButton(
            btnText: 'removeThisPhoto'.tr(context),
          onPressed: onDeletePhotoPressed,
        )
      ],
    ) :
    Container(
        height: 200.h,
        decoration: DottedDecoration(
          strokeWidth: 1.2.w,
            shape: Shape.box,
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: GestureDetector(
          onTap: ()
          {
            showDialog(context: context,
                builder: (context) => OpenCameraOrGalleryContainer(
                  onGalleryTap: onGalleryTap,
                  onCameraTap: onCameraTap,
                ),);
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Container(
                  width: 55.w,
                  height: 55.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.upload_file_outlined,
                      color: AppColors.white,
                      size: 25.sp,
                    ),
                  ),
                ),
                SpaceWidget(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'clickToUpload'.tr(context),
                        style: AppTextStyles.regular16(context).copyWith(color: Color(0xff32343E))
                    ),
                    Text(
                      'healthCertificate'.tr(context),
                      style: AppTextStyles.regular16(context).copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),

              ]
          ),
        ),
            ),
      );
  }
}
