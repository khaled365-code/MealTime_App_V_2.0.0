

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/utils/app_colors.dart';

import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_assets.dart';

class Splash2Screen extends StatefulWidget {
  const Splash2Screen({super.key});

  @override
  State<Splash2Screen> createState() => _Splash2ScreenState();
}

class _Splash2ScreenState extends State<Splash2Screen> {

  @override
  void initState()
  {
    getDelayed(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
          Stack(
            clipBehavior: Clip.none,
            children:
            [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                color: AppColors.white,
              ),
              isArabic()==false?
              PositionedDirectional(
                  top: 0,
                  start: 0,
                  child: Image.asset(
                    ImageConstants.splashTopElipsisImage,
                    fit: BoxFit.cover,
                  ))
              :
              PositionedDirectional(
                  top: 0,
                  end: MediaQuery.sizeOf(context).width*.99,
                  child: Transform(
                    transform: Matrix4.rotationY(3.14),
                      child: Image.asset(ImageConstants.splashTopElipsisImage,fit: BoxFit.cover,))),
              Align(
                alignment: AlignmentDirectional.center,
                  child: Image.asset(ImageConstants.splashLogoSmallImage,fit: BoxFit.cover,)),
              isArabic()==false?
              PositionedDirectional(
                  bottom: 0,
                  end: 0,
                  child: Image.asset(ImageConstants.splashBottomElipsisImage,fit: BoxFit.cover,)):
              PositionedDirectional(
                  top: MediaQuery.sizeOf(context).height*.71,
                  end: 0,
                  child: Transform.rotate(
                    angle: 1.6,
                      child: Image.asset(ImageConstants.splashBottomElipsisImage,fit: BoxFit.cover,))),
            ],
          )),
    );
  }

  getDelayed({required BuildContext context})
  {
    Future.delayed(Duration(milliseconds: 3000),()
    {
      navigate(context: context, route: Routes.onBoardingScreen,replacement: true);
    },);

  }
}
