import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/database/errors/error_model.dart';
import '../../../data/repos/auth_repo_implementation.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authRepoImplementation}) : super(SignupInitial());


  static SignupCubit get(context)=>BlocProvider.of(context);


  AuthRepoImplementation authRepoImplementation;

  IconData passwordSuffixIcon=Icons.visibility_off;
  IconData confirmPasswordSuffixIcon=Icons.visibility_off;

  bool passwordSecureText=true;
  bool confirmPasswordSecureText=true;



  changeConfirmPasswordIconShape()
  {

    if(confirmPasswordSuffixIcon==Icons.visibility_off)
    {
      confirmPasswordSuffixIcon=Icons.visibility;
      confirmPasswordSecureText=false;
    }
    else
    {
      confirmPasswordSuffixIcon=Icons.visibility_off;
      confirmPasswordSecureText=true;

    }
    emit(changeConfirmPasswordIcon());

  }
  changePasswordIconShape()
  {

    if(passwordSuffixIcon==Icons.visibility_off)
      {
        passwordSuffixIcon=Icons.visibility;
        passwordSecureText=false;
      }
    else
      {
        passwordSuffixIcon=Icons.visibility_off;
        passwordSecureText=true;
      }
    emit(changePasswordIconForPasswordTextField());
  }


  AutovalidateMode signUpAutoValidateMode=AutovalidateMode.disabled;

  activateSignUpValidateMode()
  {
    signUpAutoValidateMode=AutovalidateMode.always;
    emit(ActivateSignUpValidateModeState());
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController minimumChargeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  GlobalKey<FormState> signupFormKey=GlobalKey();


  XFile? signupImage;

  uploadSignupImage({required XFile image})
  {
    signupImage=image;
    emit(UploadSignupImageState());

  }

  deleteSignupImage()
  {
    signupImage=null;
    emit(DeleteSignupImageState());
  }

  XFile? healthCertificateImage;
  uploadHealthCertificateImage({required XFile image})
  {
    healthCertificateImage=image;
    emit(UploadHealthCertificateImageState());

  }

  deleteHealthCertificateImage()
  {
    healthCertificateImage=null;
    emit(DeleteHealthCertificateImageState());
  }


  signupFun({
    required String name, required String phone,
    required String email, required String password,
    required String passwordConfirmation,
    required String brandName, required double minimumCharge,
    required String description,}) async
  {
    emit(SignUpLoadingState());
   final response=await authRepoImplementation.signup(name: name, phone: phone,
       email: email, password: password,
       passwordConfirmation: passwordConfirmation, location: '{"name":"Mansoura","address":"Dakahlia Egypt","coordinates":[31.04352521315619, 31.38737220898334]}',
       brandName: brandName, minimumCharge: minimumCharge,
       description: description,
       healthCertificate: await uploadImageToAPI(healthCertificateImage!),
       frontId: await uploadImageToAPI(healthCertificateImage!),
       backId: await uploadImageToAPI(healthCertificateImage!),
       profilePic: signupImage!=null? await uploadImageToAPI(signupImage!): null);


   response.fold((errorModel) => emit(SignUpFailureState(theError: errorModel)),
           (successMessage) => emit(SignUpSuccessState(message: successMessage)));


  }

}
