
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import 'package:new_meal_time_app/core/utils/app_assets.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/signup_cubit/signup_cubit.dart';
import '../widgets/auth_header.dart';
import '../widgets/login/options_for_account_widget.dart';
import '../widgets/signup/brand_name_field.dart';
import '../widgets/signup/confirm_pass_field.dart';
import '../widgets/signup/description_field.dart';
import '../widgets/signup/email_field.dart';
import '../widgets/signup/healt_certi_section.dart';
import '../widgets/signup/min_charge_field.dart';
import '../widgets/signup/name_field.dart';
import '../widgets/signup/password_field.dart';
import '../widgets/signup/phone_field.dart';
import '../../../../../core/utils/app_colors.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key}); // تعريف شاشة تسجيل الحساب

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        handleSignUpListener(state, context); // هنا بتشغل الفانكشن اللي بتتعامل مع الحالات اللي بتحصل أثناء التسجيل
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AuthHeaderWidget(
                hasBackButton: true, // لو فيه زرار يرجعك للشاشة اللي قبل
                title: 'signUp'.tr(context), // العنوان الرئيسي للشاشة
                subTitle: 'signUpStarted'.tr(context), // وصف صغير تحت العنوان
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter, // بنحط الحاجة اللي جوا الكونتينر ده تحت في النص
                child: Container(
                    width: MediaQuery.sizeOf(context).width, // العرض بيبقى نفس عرض الشاشة
                    height: MediaQuery.sizeOf(context).height * (540 / 812), // بنحدد ارتفاع الكونتينر بنسبة من ارتفاع الشاشة
                    decoration: BoxDecoration(
                      color: AppColors.white, // الخلفية لونها أبيض
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.r), // حواف دائرية فوق يمين
                        topLeft: Radius.circular(25.r), // حواف دائرية فوق شمال
                      ),
                    ),
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false, // الكونتينر ده ثابت مش بيتحرك
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: 24.w), // مسافة من على الشمال
                            child: BlocBuilder<SignupCubit, SignupState>(
                              builder: (context, state) {
                                return Form(
                                  key: SignupCubit.get(context).signupFormKey, // المفتاح اللي بيساعدنا نتحكم في النموذج
                                  autovalidateMode: SignupCubit.get(context).signUpAutoValidateMode, // وضع الفاليديشن (التحقق) التلقائي
                                  child: Column(
                                    children: [
                                      SpaceWidget(height: 24), // مسافة فاضية بين الحاجات اللي فوق وتحت
                                      Center(
                                        child: SignupCubit.get(context).signupImage == null // لو المستخدم لسه محملش صورة
                                            ? ImagePickerWidget(
                                          onCameraTap: () {
                                            imagePick(imageSource: ImageSource.camera).then((value) {
                                              SignupCubit.get(context).uploadSignupImage(image: value!); // لو اختار صورة بالكاميرا نرفعها
                                            });
                                            Navigator.pop(context); // نرجع للشاشة بعد اختيار الصورة
                                          },
                                          onGalleryTap: () {
                                            imagePick(imageSource: ImageSource.gallery).then((value) {
                                              SignupCubit.get(context).uploadSignupImage(image: value!); // لو اختار صورة من المعرض نرفعها
                                            });
                                            Navigator.pop(context); // نرجع للشاشة بعد اختيار الصورة
                                          },
                                        )
                                            : ImagePickerWidget(
                                          onDeletePhotoTap: () {
                                            SignupCubit.get(context).deleteSignupImage(); // لو ضغط على حذف الصورة، نحذفها
                                          },
                                          imagePath: SignupCubit.get(context).signupImage!.path, // نعرض الصورة اللي المستخدم رفعها
                                        ),
                                      ),
                                      SpaceWidget(height: 24), // مسافة بين الحاجات
                                      NameField(), // حقل الاسم اللي هيكتبه المستخدم
                                      SpaceWidget(height: 24), // مسافة تانية
                                      PhoneField(), // حقل التليفون
                                      SpaceWidget(height: 24), // مسافة
                                      EmailField(), // حقل الإيميل
                                      SpaceWidget(height: 24), // مسافة
                                      PasswordField(), // حقل الباسورد
                                      SpaceWidget(height: 24), // مسافة
                                      ConfirmPassField(), // حقل تأكيد الباسورد
                                      SpaceWidget(height: 24), // مسافة
                                      BrandNameField(), // حقل اسم البراند أو الشركة
                                      SpaceWidget(height: 24), // مسافة
                                      MinChargeField(), // حقل الحد الأدنى للتكلفة
                                      SpaceWidget(height: 24), // مسافة
                                      DescriptionField(), // حقل الوصف
                                      SpaceWidget(height: 24), // مسافة
                                      HealthCertificationSection(), // جزء الشهادة الصحية
                                      Expanded(child: SpaceWidget(height: 47)), // مساحة فاضية تحت عشان الشكل يكون منظم
                                      state is SignUpLoadingState // لو حالة التسجيل شغالة
                                          ? Center(
                                        child: SharedLoadingIndicator(), // نعرض مؤشر تحميل
                                      )
                                          : Padding(
                                        padding: EdgeInsetsDirectional.only(end: 24.w), // مسافة من اليمين
                                        child: SharedButton(
                                          btnText: 'signUp'.tr(context), // زرار التسجيل
                                          onPressed: () {
                                            performRegistrationProcess(SignupCubit.get(context), context); // تشغيل عملية التسجيل
                                          },
                                        ),
                                      ),
                                      SpaceWidget(height: 24), // مسافة
                                      OptionsForAccountWidget(
                                        title1: 'alreadyHaveAccount'.tr(context), // النص اللي بيقول "عندك حساب؟"
                                        title2: 'signIn'.tr(context), // النص اللي بيقول "تسجيل الدخول"
                                        onActionTapped: () {
                                          Navigator.pop(context); // يرجعك للشاشة اللي فاتت
                                        },
                                      ),
                                      SpaceWidget(height: 30), // مسافة
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleSignUpListener(SignupState state, BuildContext context) {
    if (state is SignUpSuccessState) {
      // لو التسجيل نجح
      buildScaffoldMessenger(
          context: context,
          msg: 'accountCreatedSuccessfully'.tr(context)); // رسالة إنه الحساب اتعمل بنجاح
      buildScaffoldMessenger(
          context: context,
          msg: 'signInToEnterAccount'.tr(context)); // رسالة إنه يقدر يدخل بالحساب
      navigate(context: context, route: Routes.loginScreen); // يوديه لشاشة تسجيل الدخول
    }
    if (state is SignUpFailureState) {
      // لو التسجيل فشل
      if (state.theError.error != null) {
        buildScaffoldMessenger(
            iconWidget: Icon(Icons.error_outline, color: AppColors.white, size: 25.sp), // أيقونة الخطأ
            context: context,
            msg: state.theError.error!.toString().substring(1, state.theError.error!.toString().length - 1)); // نعرض رسالة الخطأ
      } else {
        buildScaffoldMessenger(
            iconWidget: Icon(Icons.error_outline, color: AppColors.white, size: 25.sp),
            context: context,
            msg: state.theError.errorMessage!); // نعرض رسالة الخطأ لو فيه
      }
    }
  }

  void performRegistrationProcess(SignupCubit signupCubit, BuildContext context) async {
    if (await InternetConnectionCheckingService.checkInternetConnection() == true) {
      // التحقق من الاتصال بالإنترنت
      if (signupCubit.signupFormKey.currentState!.validate()) {
        // لو الفورم كله صح
        if (signupCubit.healthCertificateImage == null) {
          // لو مفيش شهادة صحية مرفوعة
          buildScaffoldMessenger(
              iconWidget: Icon(Icons.error_outline, color: AppColors.white, size: 25.sp),
              context: context,
              msg: 'pleaseUploadCertificate'.tr(context)); // رسالة للمستخدم يرفع الشهادة الصحية
        } else {
          SignupCubit.get(context).signupFormKey.currentState!.save(); // نحفظ البيانات من الفورم
          signupCubit.signupFun(
              name: signupCubit.nameController.text, // الاسم
              phone: signupCubit.phoneController.text, // التليفون
              email: signupCubit.emailController.text, // الإيميل
              password: signupCubit.passwordController.text, // الباسورد
              passwordConfirmation: signupCubit.confirmPassController.text, // تأكيد الباسورد
              brandName: signupCubit.brandNameController.text, // اسم البراند
              minimumCharge: double.parse(signupCubit.minimumChargeController.text), // الحد الأدنى للتكلفة
              description: signupCubit.descriptionController.text); // الوصف
        }
      } else {
        // لو الفورم فيه مشاكل
        signupCubit.activateSignUpValidateMode(); // يفعل وضع التحقق التلقائي
      }
    } else {
      // لو مفيش إنترنت
      buildScaffoldMessenger(
          context: context,
          msg: 'youAreOffline'.tr(context),
          iconWidget: Icon(Icons.wifi_off, color: AppColors.white)); // رسالة إنه مفيش إنترنت
    }
  }
}

