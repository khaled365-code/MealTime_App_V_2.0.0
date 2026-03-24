import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/drawer/drawer_app_bar.dart';
import '../widgets/drawer_header_widget.dart';
import '../widgets/drawer/logout_and_delete_account_container.dart';
import '../widgets/drawer/meals_and_notifications_container.dart';
import '../widgets/drawer/personal_and_edit_profile_container.dart';
import '../widgets/drawer/settings_and_faq_container.dart';


class CustomDrawerScreen extends StatelessWidget {
  const CustomDrawerScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child:
          CustomScrollView(
              slivers:
              [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 24.w, end: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpaceWidget(height: 32,),
                        DrawerAppBar(),
                        SpaceWidget(height: 24,),
                        DrawerHeaderWidget(),
                        SpaceWidget(height: 32,),
                        PersonalAndEditProfileBodyContainer(),
                        SpaceWidget(height: 20,),
                        MealsAndNotificationsContainer(),
                        SpaceWidget(height: 20,),
                        SettingsAndFaqContainer(),
                        SpaceWidget(height: 20,),
                        LogoutAndDeleteAccountContainer(),
                        SpaceWidget(height: 29,),

                      ],
                    ),
                  ),
                ),


              ])),
    );
  }
}











