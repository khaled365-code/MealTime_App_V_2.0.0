
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
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state)
      {
        handleSignUpListener(state, context);
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AuthHeaderWidget(
                hasBackButton: true,
                title: 'signUp'.tr(context),
                subTitle: 'signUpStarted'.tr(context),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * (540/ 812),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.r),
                        topLeft: Radius.circular(25.r),
                      ),
                    ),
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: 24.w,),
                            child: BlocBuilder<SignupCubit, SignupState>(
                            builder: (context, state) {
                            return Form(
                              key: SignupCubit.get(context).signupFormKey,
                              autovalidateMode: SignupCubit.get(context).signUpAutoValidateMode,
                              child: Column(
                                children: [
                                  SpaceWidget(height: 24,),
                                   Center(child: SignupCubit.get(context).signupImage == null ?
                                      ImagePickerWidget(
                                        onCameraTap: ()
                                        {
                                          imagePick(imageSource: ImageSource.camera).then((value) {
                                              SignupCubit.get(context).uploadSignupImage(image: value!);
                                            },
                                          );
                                          Navigator.pop(context);
                                        },
                                        onGalleryTap: ()
                                        {
                                          imagePick(
                                              imageSource: ImageSource.gallery).then((value) {
                                              SignupCubit.get(context).uploadSignupImage(image: value!);
                                            },
                                          );
                                          Navigator.pop(context);
                                        },
                                      ):
                                      ImagePickerWidget(
                                        onDeletePhotoTap: ()
                                        {
                                          SignupCubit.get(context).deleteSignupImage();
                                        },
                                        imagePath: SignupCubit.get(context).signupImage!.path,
                                      )
                                   ),
                                  SpaceWidget(height: 24,),
                                                        
                                  NameField(),
                                                        
                                  SpaceWidget(height: 24,),
                                                        
                                  PhoneField(),
                                                        
                                  SpaceWidget(height: 24,),
                                                        
                                  EmailField(),
                                                        
                                  SpaceWidget(height: 24,),
                                                        
                                  PasswordField(),
                                                        
                                  SpaceWidget(height: 24,),
                                                        
                                  ConfirmPassField(),
                                                        
                                  SpaceWidget(height: 24,),
                                                        
                                  BrandNameField(),
                                                        
                                  SpaceWidget(height: 24,),
                                                        
                                  MinChargeField(),
                                                        
                                  SpaceWidget(height: 24,),
                                                        
                                  DescriptionField(),
                                                        
                                  SpaceWidget(height: 24),
                                                        
                                  HealthCertificationSection(),
                                                        
                                  Expanded(child: SpaceWidget(height: 47,)),
                                            
                                  state is SignUpLoadingState?
                                  Center(
                                    child: SharedLoadingIndicator(),
                                  ):
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(end: 24.w),
                                    child: SharedButton(
                                      btnText: 'signUp'.tr(context),
                                      onPressed: ()
                                      {
                                        performRegistrationProcess(SignupCubit.get(context), context);
                                      },
                                    ),
                                  ),
                                            
                                            
                                  SpaceWidget(height: 24),
                                  OptionsForAccountWidget(
                                    title1: 'alreadyHaveAccount'.tr(context),
                                    title2: 'signIn'.tr(context),
                                    onActionTapped: ()
                                    {
                                      Navigator.pop(context);
                                    },
                                  ),
                                                        
                                  SpaceWidget(height: 30),

                                ],
                              ),
                            );},),),
                        ),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void handleSignUpListener(SignupState state, BuildContext context) {
    if (state is SignUpSuccessState)
    {
      buildScaffoldMessenger(
          context: context,
          msg: 'accountCreatedSuccessfully'.tr(context));
      buildScaffoldMessenger(
          context: context,
          msg: 'signInToEnterAccount'.tr(context));
      navigate(context: context, route: Routes.loginScreen);
    }
    if (state is SignUpFailureState)
    {
      if (state.theError.error != null)
      {
        buildScaffoldMessenger(
            iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
            context: context,
            msg: state.theError.error!.toString().substring(
                1, state.theError.error!.toString().length - 1));
      }
      else {
        buildScaffoldMessenger(
            iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
            context: context,
            msg: state.theError.errorMessage!);
      }
    }
  }

  void performRegistrationProcess(SignupCubit signupCubit, BuildContext context) async
  {

    if(await InternetConnectionCheckingService.checkInternetConnection()==true)
      {
        if (signupCubit.signupFormKey.currentState!.validate())
        {
          if (signupCubit.healthCertificateImage == null)
          {
            buildScaffoldMessenger(
                iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
                context: context,
                msg: 'pleaseUploadCertificate'.tr(context));
          }
          else {
            SignupCubit.get(context).signupFormKey.currentState!.save();
            signupCubit.signupFun(
                name: signupCubit.nameController.text,
                phone: signupCubit.phoneController.text,
                email: signupCubit.emailController.text,
                password: signupCubit.passwordController.text,
                passwordConfirmation: signupCubit.confirmPassController.text,
                brandName: signupCubit.brandNameController.text,
                minimumCharge: double.parse(signupCubit.minimumChargeController.text),
                description: signupCubit.descriptionController.text);
          }
        }
        else
        {
          SignupCubit.get(context).activateSignUpValidateMode();
        }
      }
    else
      {
        buildScaffoldMessenger(context: context, msg: 'youAreOffline'.tr(context),iconWidget: Icon(Icons.wifi_off,color: AppColors.white,));

      }

  }

}


/*


 */



