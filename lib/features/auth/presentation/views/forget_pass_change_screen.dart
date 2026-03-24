

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import 'package:new_meal_time_app/core/utils/app_assets.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../../core/widgets/name_and_text_field_widget.dart';
import '../cubits/forget_pass_cubit/forget_pass_cubit.dart';
import '../widgets/auth_header.dart';
import '../widgets/forget_pass_change/confirm_pass_field.dart';
import '../widgets/forget_pass_change/new_password_field.dart';
import '../widgets/forget_pass_change/otp_code_container.dart';
import '../../../../../core/utils/app_colors.dart';


class ForgetPassChangeScreen extends StatelessWidget {
  const ForgetPassChangeScreen({super.key}); // دي شاشة تغيير كلمة المرور لو نسيتها

  @override
  Widget build(BuildContext context) {
    String emailText = ModalRoute.of(context)!.settings.arguments as String;
    // دي بتاخد الإيميل اللي جاي من الشاشة اللي قبلها

    return BlocListener<ForgetPassCubit, ForgetPassState>(
      // دي بتسمع لو حالة تغيير كلمة المرور حصل فيها حاجة
      listener: (context, state) {
        handleChangePassListener(state, context);
        // بتتعامل مع الحالة بناءً على اللي حصل
      },
      child: Scaffold(
        body: SafeArea(
          // بتضمن إن محتوى الشاشة يكون داخل المنطقة الآمنة (زي اللي تحت النوتش)
          child: Stack(
            // عشان تقدر تحط حاجتين فوق بعض
            children: [
              AuthHeaderWidget(
                title: 'verification'.tr(context),
                // العنوان الرئيسي "التحقق"
                subTitle: 'WeSentCodeEmail'.tr(context) + '\n$emailText',
                // تحت العنوان، بيقول "بعتنا الكود على الإيميل" وبيكتب الإيميل
                hasBackButton: true,
                // زرار رجوع للشاشة اللي فاتت
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                // بيحط المحتوى في النص تحت
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  // العرض على قد الشاشة
                  height: MediaQuery.sizeOf(context).height * (525 / 812),
                  // الطول كنسبة من طول الشاشة
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // لون الخلفية أبيض
                    borderRadius: BorderRadius.only(
                      // زوايا مدورة للجزء اللي فوق
                      topRight: Radius.circular(25.r),
                      topLeft: Radius.circular(25.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                    // مسافة من الجوانب
                    child: BlocBuilder<ForgetPassCubit, ForgetPassState>(
                      // بحدث المحتوى بناءً على حالة ForgetPassCubit
                      builder: (context, state) {
                        return Form(
                          // الفورم اللي هيتعبى
                          autovalidateMode: ForgetPassCubit.get(context).verifyCodeAutoValidateMode,
                          // التحقق التلقائي للفورم
                          key: ForgetPassCubit.get(context).verifyCodeFormKey,
                          // المفتاح الخاص بالفورم
                          child: Column(
                            children: [
                              SpaceWidget(height: 24,),
                              // مسافة صغيرة
                              NewPasswordField(),
                              // حقل كلمة المرور الجديدة
                              SpaceWidget(height: 24,),
                              ConfirmPassField(),
                              // حقل تأكيد كلمة المرور
                              SpaceWidget(height: 24.h,),
                              NameAndTextFieldWidget(
                                title: 'code'.tr(context),
                                // عنوان الحقل "الكود"
                                childWidget: Row(
                                  // بيعمل صف فيه حقول الكود
                                  children: List.generate(
                                    6,
                                    // بيعمل 6 مربعات عشان الكود
                                        (index) => Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            end: index != 5 ? 10.w : 0),
                                        // مسافة بين المربعات إلا الأخير
                                        child: OtpCodeContainer(
                                          singleContainerController: getCodeController(
                                              index: index,
                                              forgetPassCubit: ForgetPassCubit.get(context)),
                                          // بياخد كل مربع بالكود الخاص بيه
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SpaceWidget(height: 30,),
                              // مسافة تحت
                              state is ForgetPassChangeWithCodeLoadingState
                                  ? Center(
                                child: SharedLoadingIndicator(),
                                // لو بتحميل يعرض دائرة تحميل
                              )
                                  : SharedButton(
                                btnText: 'verify'.tr(context),
                                // الزر اللي بيأكد الكود
                                onPressed: () {
                                  verifyCodeActionButton(context, emailText);
                                  // يتعامل مع الكود اللي المستخدم دخله
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
            ],
          ),
        ),
      ),
    );
  }

  void handleChangePassListener(ForgetPassState state, BuildContext context) {
    // دي بتتعامل مع تغيير الحالة لما المستخدم يعمل أي أكشن
    if (state is ForgetPassChangeWithCodeFailureState) {
      // لو حصلت مشكلة في التغيير
      if (state.errorModel.error != null) {
        buildScaffoldMessenger(
          iconWidget: Icon(Icons.error_outline, color: AppColors.white, size: 25.sp,),
          // بيعرض أيقونة خطأ
          context: context,
          msg: state.errorModel.error!.toString()
              .substring(1, state.errorModel.error!.toString().length - 1),
          // الرسالة بتاعة الخطأ
        );
      } else {
        buildScaffoldMessenger(
          iconWidget: Icon(Icons.error_outline, color: AppColors.white, size: 25.sp,),
          context: context,
          msg: state.errorModel.errorMessage!,
          // رسالة خطأ عامة
        );
      }
    }
    if (state is ForgetPassChangeWithCodeSuccessState) {
      // لو التغيير تم بنجاح
      buildScaffoldMessenger(
        context: context,
        msg: 'youHaveSetNewPasswordSuccessfully'.tr(context),
        // بيعرض رسالة نجاح
        iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
        // أيقونة نجاح
      );
      navigate(context: context, route: Routes.loginScreen, replacement: true);
      // بيرجع لصفحة تسجيل الدخول
    }
  }

  void verifyCodeActionButton(BuildContext context, String emailText) async {
    // الفانكشن اللي بتشتغل لما يضغط على زر "تأكيد"
    if (await InternetConnectionCheckingService.checkInternetConnection() == true) {
      // لو فيه نت
      if (ForgetPassCubit.get(context).verifyCodeFormKey.currentState!.validate()) {
        // لو الفورم صحيح
        ForgetPassCubit.get(context).verifyCodeFormKey.currentState!.save();
        // يحفظ القيم
        ForgetPassCubit.get(context).forgetPassChangeWithCodeFun(
          email: emailText,
          // الإيميل
          code: getCompleteEmail(forgetPassCubit: ForgetPassCubit.get(context)),
          // الكود اللي المستخدم كتبه
          password: ForgetPassCubit.get(context).newPasswordController.text,
          // كلمة المرور الجديدة
          confirmPassword: ForgetPassCubit.get(context).confirmNewPasswordController.text,
          // تأكيد كلمة المرور
        );
      } else {
        ForgetPassCubit.get(context).activateVerifyCodeAutoValidateMode();
        // يفعّل التحقق التلقائي
      }
    } else {
      // لو مفيش نت
      buildScaffoldMessenger(
        context: context,
        msg: 'youAreOffline'.tr(context),
        iconWidget: Icon(Icons.wifi_off, color: AppColors.white,),
        // يعرض رسالة "أنت أوفلاين"
      );
    }
  }

  TextEditingController getCodeController({required int index, required ForgetPassCubit forgetPassCubit}) {
    // بيجيب الكنترولر الخاص بكل مربع من مربعات الكود
    switch (index) {
      case 0:
        return forgetPassCubit.firstCodeController;
      case 1:
        return forgetPassCubit.secondCodeController;
      case 2:
        return forgetPassCubit.thirdCodeController;
      case 3:
        return forgetPassCubit.fourthCodeController;
      case 4:
        return forgetPassCubit.fifthCodeController;
      case 5:
        return forgetPassCubit.sixthCodeController;
      default:
        return forgetPassCubit.firstCodeController;
    }
  }

  String getCompleteEmail({required ForgetPassCubit forgetPassCubit}) {
    // بيجمع الكود اللي المستخدم كتبه في المربعات
    return forgetPassCubit.firstCodeController.text +
        forgetPassCubit.secondCodeController.text +
        forgetPassCubit.thirdCodeController.text +
        forgetPassCubit.fourthCodeController.text +
        forgetPassCubit.fifthCodeController.text +
        forgetPassCubit.sixthCodeController.text;
  }
}


