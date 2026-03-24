

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../data/models/onboarding_data_model.dart';
import '../widgets/dot_container_item.dart';
import '../widgets/page_view_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {


  List<OnboardingDataModel>onboardingDataModelList =
  [
    OnboardingDataModel(image: ImageConstants.onboardingImage1, title: 'allYourFavorites', subtitle: 'getAllLovedFoods'),
    OnboardingDataModel(image: ImageConstants.onboardingImage2, title: 'mealFromChosenChef', subtitle: 'getAllLovedFoods'),
    OnboardingDataModel(image: ImageConstants.onboardingImage3, title: 'freeDeliveryOffers', subtitle: 'getAllLovedFoods'),

  ];

  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState()
  {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex=pageController.page!.toInt();
      });
    },);
    super.initState();
  }
  @override
  void dispose()
  {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).width);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height*(114/812),),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                  itemCount: onboardingDataModelList.length,
                  itemBuilder: (context, index) => PageViewContent(
                    onboardingDataModel: onboardingDataModelList[index],
                  ),),
            ),
            SpaceWidget(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: EdgeInsetsDirectional.only(end: 12.w),
                  child: DotContainerItem(
                    isActive: index == currentIndex,
                  ),
                ),
              ),
            ),
            SpaceWidget(height: 69,),
            SharedButton(
              btnText: currentIndex!=2?
            'next'.tr(context):'getStarted'.tr(context),
              onPressed: ()
              {
                if(currentIndex!=2)
                  {
                    pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
                  }
                else
                  {
                    navigate(context: context, route: Routes.loginScreen,replacement: true);
                  }
              },
            ),
            SizedBox(height: 16,),
            currentIndex!=2?
            GestureDetector(
              onTap: ()
                {
                  navigate(context: context, route: Routes.loginScreen,replacement: true);
                },
                child: Text('skip'.tr(context),style: AppTextStyles.regular16(context).copyWith(color: Color(0xff646982)),)):SizedBox.shrink(),
            currentIndex!=2? SizedBox(height: 40,):SizedBox(height: 59,),


          ],
        ),
      ),
    );
  }
}
