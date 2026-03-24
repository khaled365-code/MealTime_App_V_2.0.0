
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import 'package:new_meal_time_app/core/utils/app_assets.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/forget_pass_cubit/forget_pass_cubit.dart';
import '../widgets/auth_header.dart';
import '../widgets/send_code/email_field_send_code.dart';

class ForgetPasswordSendCodeScreen extends StatelessWidget {
  const ForgetPasswordSendCodeScreen({super.key}); // تعريف واجهة الشاشة

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPassCubit, ForgetPassState>( // بيستمع لأي تغيير في حالة الكيوبت
      listener: (context, state) { // لما الحالة تتغير، ينفذ الكود دا
        handleForgetPassSendCodeListener(state, context, ForgetPassCubit.get(context)); // استدعاء دالة لمعالجة الحالات المختلفة
      },
      child: Scaffold( // الإطار الأساسي للشاشة
          body: SafeArea( // للتأكد من أن المحتوى ما يتعارضش مع الجزء العلوي أو السفلي
              child: Stack( // عشان يتعامل مع العناصر فوق بعضها
                clipBehavior: Clip.none, // السماح بخروج العناصر عن الحواف
                children: [
                  AuthHeaderWidget( // عنصر الهيدر الخاص بالشاشة
                    hasBackButton: true, // يضيف زر الرجوع
                    title: 'forgotPassword'.tr(context), // العنوان مع الترجمة
                    subTitle: 'pleaseSignIn'.tr(context), // النص الفرعي مع الترجمة
                  ),
                  Align( // تحديد موضع العنصر السفلي
                    alignment: AlignmentDirectional.bottomCenter, // في المنتصف أسفل الشاشة
                    child: Container( // حاوية التصميم الخاص بالمحتوى السفلي
                      width: MediaQuery.sizeOf(context).width, // عرض الحاوية يكون بعرض الشاشة
                      height: MediaQuery.sizeOf(context).height *(540/812), // ارتفاع الحاوية كنسبة من ارتفاع الشاشة
                      decoration: BoxDecoration( // تصميم الحواف والألوان
                        color: AppColors.white, // اللون أبيض
                        borderRadius: BorderRadius.only( // تحديد الحواف العلوية المدورة
                          topRight: Radius.circular(25.r),
                          topLeft: Radius.circular(25.r),
                        ),
                      ),
                      child: Padding( // إضافة تباعد داخلي
                        padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w), // التباعد بين الجوانب
                        child: BlocBuilder<ForgetPassCubit, ForgetPassState>( // متابعة التغييرات في الكيوبت
                          builder: (context, state) { // بناء الواجهة بناءً على الحالة
                            return Form( // إنشاء فورم
                              autovalidateMode: ForgetPassCubit.get(context).sendCodeAutoValidateMode, // وضع التحقق التلقائي
                              key: ForgetPassCubit.get(context).sendEmailFormKey, // مفتاح التحقق من الفورم
                              child: Column( // ترتيب العناصر بشكل عمودي
                                children: [
                                  SpaceWidget(height: 24,), // مسافة فاصلة
                                  EmailFieldSendCode(), // حقل إدخال البريد الإلكتروني
                                  SpaceWidget(height: 30,), // مسافة فاصلة
                                  state is ForgetPassSendCodeLoadingState ? // لو في حالة تحميل
                                  Center( // عرض دائرة تحميل
                                    child: SharedLoadingIndicator(),
                                  ):
                                  SharedButton( // زر الإرسال
                                    btnText: 'sendCode'.tr(context), // نص الزر مع الترجمة
                                    onPressed: () async { // لما يتم الضغط على الزر
                                      if(await InternetConnectionCheckingService.checkInternetConnection()==true) { // التحقق من الاتصال بالإنترنت
                                        if (ForgetPassCubit.get(context).sendEmailFormKey.currentState!.validate()) { // التحقق من صحة الفورم
                                          ForgetPassCubit.get(context).sendEmailFormKey.currentState!.save(); // حفظ البيانات
                                          ForgetPassCubit.get(context).forgetPassSendCodeFun( // استدعاء دالة الإرسال
                                              email: ForgetPassCubit.get(context).emailForForgetPassController.text); // إرسال البريد الإلكتروني
                                        } else {
                                          ForgetPassCubit.get(context).activateSendCodeAutoValidateMode(); // تفعيل وضع التحقق التلقائي
                                        }
                                      } else {
                                        buildScaffoldMessenger(context: context, msg: 'youAreOffline'.tr(context),iconWidget: Icon(Icons.wifi_off,color: AppColors.white,)); // رسالة انقطاع الاتصال
                                      }
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ))

      ),
    );
  }

  void handleForgetPassSendCodeListener(ForgetPassState state, BuildContext context, ForgetPassCubit forgetPassCubit) {
    // دالة للتعامل مع الحالات المختلفة
    if (state is ForgetPassSendCodeSuccessState) {
      buildScaffoldMessenger( // رسالة نجاح
          iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon), // أيقونة النجاح
          context: context,
          msg: 'checkYourEmail'.tr(context)); // رسالة التأكيد
      navigate(context: context, // الانتقال إلى شاشة تغيير كلمة المرور
          route: Routes.forgetPassChangeScreen,
          arg: forgetPassCubit.emailForForgetPassController.text); // تمرير البريد الإلكتروني
    }
    if (state is ForgetPassSendCodeFailureState) {
      if (state.errorModel.error != null) {
        buildScaffoldMessenger( // رسالة خطأ
            iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
            context: context,
            msg: state.errorModel.error!.toString().substring(
                1, state.errorModel.error!.toString().length - 1)); // رسالة الخطأ
      } else {
        buildScaffoldMessenger( // رسالة خطأ بديلة
            iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
            context: context,
            msg: state.errorModel.errorMessage!);
      }
    }
  }
}
