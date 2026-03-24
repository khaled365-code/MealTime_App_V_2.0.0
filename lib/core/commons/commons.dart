


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cross_file/cross_file.dart';
import 'package:new_meal_time_app/core/database/api/api_keys.dart';
import 'package:new_meal_time_app/core/database/cache/cache_helper.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../widgets/space_widget.dart';


void navigate({required BuildContext context ,required String route, Object? arg,bool replacement=false})
{
  if(replacement==true)
    {
      Navigator.pushReplacementNamed(context,route,arguments: arg);
    }
  else
    {
      Navigator.pushNamed(context, route,arguments: arg);

    }
}
Future uploadImageToAPI(XFile image) async
{
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}


 showToast({
  required String msg,
  required ToastStates toastStates,
  ToastGravity? gravity,
 required BuildContext context})
{
  FToast().init(context);
  FToast().showToast(
      child: Container(
      padding:  EdgeInsetsDirectional.only(start: 10.w,top: 20.h,bottom: 20.h ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.r),
        color: toastStates == ToastStates.success ?
        AppColors.c39AE53 :
        toastStates==ToastStates.error?
        AppColors.cDE4553:
        AppColors.cFEC51A,
      ),
      child: Row(
        children: [
          toastStates==ToastStates.success?
           SvgPicture.asset(ImageConstants.checkCircleIcon):
          toastStates==ToastStates.error?
          SvgPicture.asset(ImageConstants.errorIcon,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),):
          SvgPicture.asset(ImageConstants.triangleWarningIcon,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),),
          SpaceWidget(width: 10.w,),
          Text(msg,
              style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'sen',
            color:AppColors.white,
          )),
        ],
      ),
    ),
   gravity: gravity??ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
  );

}

Future<XFile?> imagePick({required ImageSource imageSource}) async
{
  XFile? image =await ImagePicker().pickImage(source: imageSource);
  return image;

}

enum ToastStates{success,error,warning}


buildScaffoldMessenger({required BuildContext context,required String msg,SnackBarBehavior? snackBarBehavior,Widget? iconWidget,})
{

   return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         showCloseIcon: false,
    content: Row(
      children: [
        FittedBox(
          fit:BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            msg,
            style: AppTextStyles.bold15(context).copyWith(color: AppColors.white),
          ),
        ),
      ],
    ),
    elevation: 0,
    backgroundColor: AppColors.primaryColor,
    behavior: snackBarBehavior?? SnackBarBehavior.fixed,
    duration: Duration(seconds: 5),
  ));

}

String formatDate({required DateTime dateTime,bool? monthName=false,bool? isArabic=false,required BuildContext context})
{
  int year = dateTime.year;
  int month = dateTime.month;
  int day = dateTime.day;
  if(monthName==true)
    {
      return '$day ${getMonthName(month,context)} $year';
    }
  else
    {
      if(isArabic==true)
        {
          return '$year/$month/$day';
        }
      return '$day/$month/$year';

    }
}

String getMonthName(int month,BuildContext context)
{
  switch(month)
  {
    case 1:
      return 'january'.tr(context);
    case 2:
      return 'february'.tr(context);
    case 3:
      return 'march'.tr(context);
    case 4:
      return 'april'.tr(context);
    case 5:
      return 'may'.tr(context);
    case 6:
      return 'june'.tr(context);
    case 7:
      return 'july'.tr(context);
    case 8:
      return 'august'.tr(context);
    case 9:
      return 'september'.tr(context);
    case 10:
      return 'october'.tr(context);
    case 11:
      return 'november'.tr(context);
    default:
      return 'december'.tr(context);
  }
}

String formatClock({required DateTime dateTime,bool? isArabic})
{
  int hour = dateTime.hour;
  int minute = dateTime.minute;
  if(isArabic==true)
    {
      return '$minute:$hour';
    }
  return '$hour:$minute';
}

getAmorPm(DateTime dateTime,BuildContext context)
{
  int hour = dateTime.hour;
  if (hour > 12)
  {
    return 'pm'.tr(context);
  } else
  {
    return 'am'.tr(context);
  }
}

getCurrentGreetingTime(BuildContext context)
{
  if (DateTime.now().hour < 12)
  {
    return 'goodMorning'.tr(context);
  }
  else if (DateTime.now().hour < 17)
  {
    return 'goodAfternoon'.tr(context);
  }
  else
  {
    return 'goodEvening'.tr(context);
  }
}

 Future<XFile> getImageXFileByUrl(String url) async
 {
   var file = await DefaultCacheManager().getSingleFile(url);
   XFile result = await XFile(file.path);
   return result;
 }

 Future<String> getImagePathFromUrl(String url) async
 {
   var file = await DefaultCacheManager().getSingleFile(url);
   return file.path;
 }

String translateNumbersToArabic(dynamic input) {
  const Map<String, String> numberMap = {
    '0': '٠',
    '1': '١',
    '2': '٢',
    '3': '٣',
    '4': '٤',
    '5': '٥',
    '6': '٦',
    '7': '٧',
    '8': '٨',
    '9': '٩',
  };

  // Convert input to string if it is an integer
  String inputString = input.toString();

  StringBuffer translated = StringBuffer();

  for (int i = 0; i < inputString.length; i++) {
    String char = inputString[i];
    translated.write(numberMap[char] ?? char); // Keep the original character if it's not a digit
  }
  return translated.toString();

}

bool isArabic()
{
  if(CacheHelper().getData(key: ApiKeys.appCurrentLanguage)== null||
      CacheHelper().getData(key: ApiKeys.appCurrentLanguage)=='en')
  {
    return false;
  }
  return true;
}

