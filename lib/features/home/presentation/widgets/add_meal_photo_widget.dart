



import 'dart:io';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/open_camera_or_gallery_container.dart';
import '../../../../core/widgets/space_widget.dart';



class AddMealPhotoWidget extends StatelessWidget {
  const AddMealPhotoWidget({super.key, this.onGalleryTap, this.onCameraTap,this.imagePath, this.onDeletePhotoPressed, this.specificUpdateText});

  final Function()? onGalleryTap;
  final Function()? onCameraTap;
  final String? imagePath;
  final void Function()? onDeletePhotoPressed;
  final String? specificUpdateText;
  @override
  Widget build(BuildContext context) {
    return imagePath==null?
    Container(
      height: 200.h,
      decoration: DottedDecoration(
          shape: Shape.box,
          borderRadius: BorderRadius.circular(16.r),
      ),
      child:  GestureDetector(
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
                    specificUpdateText==null?
                      'clickToUpload'.tr(context):'clickTo'.tr(context)+ ' ${specificUpdateText}',
                      style: AppTextStyles.regular16(context).copyWith(color: Color(0xff32343E))
                  ),
                  Text(
                    'mealImage'.tr(context),
                    style: AppTextStyles.regular16(context).copyWith(color: AppColors.primaryColor),
                  ),
                ],
              ),

            ]
        ),
      ),
    ):
    Column(
      children: [
        Container(
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
                image: FileImage(File(imagePath!)),fit: BoxFit.fill)
          ),
        ),
        SpaceWidget(height: 10.h,),
        Row(
          children: [
            Spacer(),
            GestureDetector(
                onTap: onDeletePhotoPressed,
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      ImageConstants.trashIcon,
                      width: 25.w,
                      colorFilter: ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn),
                    )
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
