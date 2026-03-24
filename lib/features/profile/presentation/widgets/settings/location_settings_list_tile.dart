


// import 'package:chef_app/features/home/presentation/cubits/home_screen_cubit/home_screen_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../core/database/api/api_keys.dart';
// import '../../../../../core/database/cache/cache_helper.dart';
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/app_text_styles.dart';
//
// class LocationSettingsListTile extends StatelessWidget {
//   const LocationSettingsListTile({
//     super.key, required this.homeCubit,
//
//   });
//
//   final HomeScreenCubit homeCubit;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text('Location Settings',style: AppTextStyles.bold15(context).copyWith(
//           color: AppColors.c32343E
//       ),),
//       subtitle: Text('Allow to use the location services on your device',style: AppTextStyles.regular14(context).copyWith(
//           color: AppColors.cA0A5BA
//       ),),
//       contentPadding: EdgeInsetsDirectional.zero,
//       trailing: Switch(
//           value: CacheHelper().getData(key: ApiKeys.locationIsActive)!=null?
//           CacheHelper().getData(key: ApiKeys.locationIsActive):
//           homeCubit.locationIsActive,
//           trackOutlineColor: WidgetStatePropertyAll(
//               AppColors.cC4C4C4
//           ),
//           thumbIcon: WidgetStatePropertyAll(Icon(Icons.circle,color: AppColors.white,size: 31.sp,)),
//           activeTrackColor: AppColors.primaryColor,
//           inactiveThumbColor: AppColors.white,
//           inactiveTrackColor: AppColors.cC4C4C4,
//           onChanged: (value)
//           {
//             homeCubit.onLocationSwitched(value: value);
//           }),
//     );
//   }
// }
