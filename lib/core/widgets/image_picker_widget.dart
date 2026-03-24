
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_meal_time_app/core/utils/app_assets.dart';
import 'package:new_meal_time_app/core/utils/app_colors.dart';
import 'open_camera_or_gallery_container.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key, this.imagePath, this.onGalleryTap, this.onCameraTap, this.onDeletePhotoTap});

  final String? imagePath;
  final Function()? onGalleryTap;
  final Function()? onCameraTap;
  final Function()? onDeletePhotoTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 130.w,
          height: 130.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.cFFC6AE,
            image: imagePath != null ?
            DecorationImage(image:FileImage(File(imagePath!)),fit: BoxFit.fill) : null,
          ),
        ),
        PositionedDirectional(
          bottom: -3.h,
          end: 3.w,
            child: imagePath == null?
            GestureDetector(
              onTap: ()
              {
                showDialog(context: context,
                  builder: (context) => OpenCameraOrGalleryContainer(
                      onCameraTap: onCameraTap,
                      onGalleryTap: onGalleryTap,
                    ),);
              },
              child: Container(
                width: 41.w,
                height: 41.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    ImageConstants.pencilEditIcon,
                  ),
                ),
              ),
            ):
            GestureDetector(
              onTap: onDeletePhotoTap,
              child: Container(
                width: 41.w,
                height: 41.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: Center(
                    child: SvgPicture.asset(
                      ImageConstants.trashIcon,
                      width: 22.w,
                      colorFilter: ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn),
                    )
                ),
              ),
            ))
      ],
    );
  }
}
