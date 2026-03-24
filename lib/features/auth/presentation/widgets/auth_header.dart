

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/space_widget.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({super.key, required this.title, required this.subTitle, this.hasBackButton});

  final String title,subTitle;
final bool? hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:  BoxDecoration(
              color: AppColors.c121223,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpaceWidget(height: MediaQuery.of(context).size.height*(118/812),),
              Text(title,style: AppTextStyles.bold30(context).copyWith(color: AppColors.white),),
              SpaceWidget(height: 3,),
              Text(subTitle,style: AppTextStyles.regular16(context).copyWith(color: AppColors.white),),

            ],
          ),
        ),
        isArabic()==false?
        Align(
           alignment: AlignmentDirectional.topStart,
            child: Transform.rotate(
              angle: -.1,
                child: Image.asset(ImageConstants.splashTopElipsisImage,color:Colors.white,)))
         :PositionedDirectional(
          end: MediaQuery.sizeOf(context).width*.7,
          top: 16.h,
          child: Transform.rotate(
              angle: 1.1,
            child: Image.asset(ImageConstants.splashTopElipsisImage,color:Colors.white,)
                   ),
         ),
         isArabic()==false?
         Align(
             alignment: AlignmentDirectional.topEnd,
            child:
            Image.asset(ImageConstants.loginOtherElipsisImage,color:hasBackButton==false?Colors.grey.withOpacity(.2):AppColors.cFF7622.withOpacity(.2),)):
         SizedBox.shrink(),

        hasBackButton==true?
        PositionedDirectional(
          top: MediaQuery.sizeOf(context).height*(35/812),
          start: 24.w,
          child: GestureDetector(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
              child: isArabic()==false?
              Center(
                child: SvgPicture.asset(
                    width: 9,
                    ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.c5E616F, BlendMode.srcIn)),):
              Transform.rotate(
                angle: 3.14159,
                child: Center(
                  child: SvgPicture.asset(
                      width: 9,
                      ImageConstants.arrowBackIcon,colorFilter: ColorFilter.mode(AppColors.c5E616F, BlendMode.srcIn)),),
              )
            ),
          ),
        ):
        SizedBox.shrink()

      ],
    );
  }
}
