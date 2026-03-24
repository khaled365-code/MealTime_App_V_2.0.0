


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/settings/account_settings_container.dart';
import '../widgets/settings/general_settings_container.dart';
import '../widgets/settings/settings_app_bar.dart';

class MainSettingsScreen extends StatelessWidget {
  const MainSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.white,
      body:SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:  EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpaceWidget(height: 32,),
                      SettingsAppBar(),
                      SpaceWidget(height: 24,),
                      GeneralSettingsContainer(),
                      SpaceWidget(height: 20,),
                      AccountSettingsContainer(),
                      SpaceWidget(height: 30,),
                    ],
                  ),
                ),
              )
            ],
          ))

    );
  }
}

