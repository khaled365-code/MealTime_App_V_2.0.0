


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/commons/global_models/local_notifications_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/space_widget.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notificationModel});

  final LocalNotificationsModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 54.w,
            height: 54.h,
            decoration: notificationModel.payload!=null?
            BoxDecoration(
              image: DecorationImage(image: FileImage(File(notificationModel.payload!)),fit: BoxFit.fill),
              shape: BoxShape.circle,
            ):
            BoxDecoration(
              image: DecorationImage(image: AssetImage(notificationModel.image!),fit: BoxFit.fill),
                shape: BoxShape.circle,
            ),
          ),
          SpaceWidget(width: 14,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    notificationModel.title,
                    style: AppTextStyles.regular13(context).copyWith(
                      color: AppColors.c32343E,
                    ),
                  ),
                ),
                SpaceWidget(height: 5,),
                Text(
                    notificationModel.body,style: AppTextStyles.regular13(context).copyWith(color: AppColors.c9C9BA6,)),
                SpaceWidget(height: 10,),
                RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: isArabic()==false?
                      formatDate(dateTime: DateTime.parse(notificationModel.notificationTime),monthName: true,context: context,).toString():
                      translateNumbersToArabic(formatDate(dateTime: DateTime.parse(notificationModel.notificationTime),monthName: true,context: context,isArabic: true).toString()),style: AppTextStyles.regular12(context).copyWith(color: AppColors.c9C9BA6,)
                    ),
                    TextSpan(text: isArabic()==false?
                    ' at ${formatClock(dateTime: DateTime.parse(notificationModel.notificationTime),)}':
                    ' عند ${translateNumbersToArabic(formatClock(dateTime: DateTime.parse(notificationModel.notificationTime),isArabic: true))}',style: AppTextStyles.regular12(context).copyWith(color: AppColors.c9C9BA6,)),
                    TextSpan(text: ' ${getAmorPm(DateTime.parse(notificationModel.notificationTime),context)}',style: AppTextStyles.regular12(context).copyWith(color: AppColors.c9C9BA6,))
                  ]
                ))
            
              ],
            ),
          )
        ],
      ),

    );
  }

}
