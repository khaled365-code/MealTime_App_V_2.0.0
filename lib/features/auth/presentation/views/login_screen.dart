




import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/database/api/api_keys.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../widgets/login/email_login_field.dart';
import '../widgets/login/password_login_field.dart';
import '../widgets/login/options_for_account_widget.dart';
import '../widgets/auth_header.dart';
import '../widgets/login/remember_me_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key}); // دي شاشة تسجيل الدخول

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>( // هنا بيتابع لو في تغيير في حالة تسجيل الدخول
      listener: (context, state) {
        handleLoginListener(state, context); // لو في تغيير هيشغل الفانكشن دي عشان يتعامل معاه
      },
      child: Scaffold(
        body: SafeArea( // ده بيضمن إن المحتوى ميطلعش برا حدود الشاشة
          child: Stack(
            children: [
              AuthHeaderWidget( // ده الواجهة اللي فوق فيها عنوان وزر (لو موجود)
                hasBackButton: false, // هنا مفيش زر رجوع
                title: 'logIn'.tr(context), // العنوان اللي فوق مكتوب "تسجيل الدخول"
                subTitle: 'pleaseSignIn'.tr(context),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter, // ده بيخلي الحاجات في النص تحت
                child: Container(
                  width: MediaQuery.sizeOf(context).width, // العرض بيكون على قد الشاشة
                  height: MediaQuery.sizeOf(context).height * (540 / 812), // الطول كنسبة من طول الشاشة
                  decoration: BoxDecoration(
                    color: Colors.white, // لون الخلفية أبيض
                    borderRadius: BorderRadius.only( // الزوايا اللي فوق معمولة مدورة
                      topRight: Radius.circular(25.r), // الزاوية اليمين فوق
                      topLeft: Radius.circular(25.r), // الزاوية الشمال فوق
                    ),
                  ),
                  child: SingleChildScrollView( // لو في محتوى كتير ينفع نعمله سكرول
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 24.w), // مسافة من البداية للشمال
                      child: BlocBuilder<LoginCubit, LoginState>( // بيتابع حالة تسجيل الدخول ويحدث الواجهة
                        builder: (context, state) {
                          return Form( // الفورم اللي هتتعبي
                            key: LoginCubit.get(context).loginFormKey, // مفتاح الفورم عشان يتحكم فيه
                            autovalidateMode: LoginCubit.get(context).loginAutoValidateMode, // التحقق التلقائي للفورم
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // الحاجات متحاذية للشمال
                              children: [
                                SpaceWidget(height: 24,), // مسافة بين الحاجات
                                EmailLoginField(), // خانة إدخال الإيميل
                                SpaceWidget(height: 24,), // مسافة بين الإيميل والباسورد
                                LoginPasswordField(), // خانة إدخال الباسورد
                                SpaceWidget(height: 24,), // مسافة تحت خانة الباسورد
                                Padding(
                                  padding: EdgeInsetsDirectional.only(end: 24.w), // مسافة من اليمين
                                  child: RememberMeWidget( // المربع اللي بتختاره لو عاوز تفتكر الحساب
                                    isRemembered: LoginCubit.get(context).isAccountRemembered, // بيتشيك لو متعلم عليه ولا لأ
                                  ),
                                ),
                                SpaceWidget(height: 31,), // مسافة تحت "تذكرني"
                                state is LoginLoadingState? // لو في حالة تحميل
                                Center(
                                  child: SharedLoadingIndicator(), // يعرض دائرة تحميل
                                )
                                    : Padding(
                                  padding: EdgeInsetsDirectional.only(end: 24.w), // مسافة من اليمين
                                  child: SharedButton( // الزرار بتاع تسجيل الدخول
                                    btnText: 'logIn'.tr(context), // النص عليه مكتوب "تسجيل الدخول"
                                    onPressed: () async {
                                      if (await InternetConnectionCheckingService.checkInternetConnection() == true) {
                                        // لو فيه نت
                                        if (LoginCubit.get(context).loginFormKey.currentState!.validate()) {
                                          // لو الفورم مكتوب فيه بيانات صحيحة
                                          LoginCubit.get(context).loginFormKey.currentState!.save(); // يحفظ المدخلات
                                          LoginCubit.get(context).loginFun( // ينادي الدالة اللي بتسجل الدخول
                                            email: LoginCubit.get(context).emailController.text, // الإيميل
                                            password: LoginCubit.get(context).passwordController.text, // الباسورد
                                          );
                                        } else {
                                          LoginCubit.get(context).changeValidateMode(); // لو البيانات غلط يغير المود
                                        }
                                      } else {
                                        // لو مفيش نت يعرض رسالة
                                        buildScaffoldMessenger(
                                          context: context,
                                          msg: 'youAreOffline'.tr(context), // "أنت أوفلاين"
                                          iconWidget: Icon(Icons.wifi_off, color: AppColors.white,),
                                          snackBarBehavior: SnackBarBehavior.floating,
                                        );
                                      }
                                    },
                                  ),
                                ),
                                SpaceWidget(height: 38,), // مسافة تحت الزر
                                OptionsForAccountWidget( // الويدجت اللي فيها "معندكش حساب؟"
                                  title1: 'notHaveAccount'.tr(context), // "معندكش حساب؟"
                                  title2: 'signUp'.tr(context), // "سجل حساب جديد"
                                  onActionTapped: () {
                                    navigate(context: context, route: Routes.signUpScreen); // يروح شاشة تسجيل جديد
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleLoginListener(LoginState state, BuildContext context) async {
    if (state is LoginFailureState) { // لو حالة الفشل
      if (state.theError.error != null) { // لو فيه خطأ معين
        buildScaffoldMessenger(
          iconWidget: Icon(Icons.error_outline, color: AppColors.white, size: 25.sp,), // أيقونة خطأ
          context: context,
          msg: state.theError.error!.toString().substring(1, state.theError.error!.toString().length - 1), // رسالة الخطأ
        );
      } else {
        buildScaffoldMessenger(
          iconWidget: Icon(Icons.error_outline, color: AppColors.white, size: 25.sp,), // أيقونة خطأ
          context: context,
          msg: state.theError.errorMessage!, // رسالة خطأ عامة
        );
      }
    }
    if (state is LoginSuccessState) { // لو تسجيل الدخول نجح
      buildScaffoldMessenger(
        context: context,
        msg: 'youLoggedInSuccessfully'.tr(context), // "تم تسجيل الدخول بنجاح"
        iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon), // أيقونة نجاح
      );
      await LoginCubit.get(context).rememberMeFun( // يحفظ الحساب لو تم اختياره
        email: LoginCubit.get(context).emailController.text, // الإيميل
        password: LoginCubit.get(context).passwordController.text, // الباسورد
      );
      navigate(context: context, route: Routes.homeScreen, replacement: true); // يروح للصفحة الرئيسية
    }
  }
}


