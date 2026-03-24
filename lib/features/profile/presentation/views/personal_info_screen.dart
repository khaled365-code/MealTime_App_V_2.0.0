


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/space_widget.dart';
import '../widgets/drawer_header_widget.dart';
import '../widgets/personal_info/personal_info_bar.dart';
import '../widgets/personal_info/personal_info_container.dart';
import '../widgets/personal_info/personal_info_container2.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers:
          [
            SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
                child: Column(
                  children: [
                    SpaceWidget(height: 32,),
                    PersonalInfoAppBar(),
                    SpaceWidget(height: 24,),
                    DrawerHeaderWidget(),
                    SpaceWidget(height: 32,),
                    PersonalInfoContainer(),
                    SpaceWidget(height: 20,),
                    PersonalInfoContainer2(),
                    SpaceWidget(height: 29,),

                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

