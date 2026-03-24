import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/database/errors/error_model.dart';
import '../../../data/repos/auth_repo_implementation.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit({required this.authRepoImplementation}) : super(ForgetPassInitial());


  static ForgetPassCubit get(context)=>BlocProvider.of(context);

  final AuthRepoImplementation authRepoImplementation;

  TextEditingController emailForForgetPassController=TextEditingController();

  GlobalKey<FormState> sendEmailFormKey=GlobalKey();

  GlobalKey<FormState> verifyCodeFormKey=GlobalKey();


  TextEditingController firstCodeController=TextEditingController();
  TextEditingController secondCodeController=TextEditingController();
  TextEditingController thirdCodeController=TextEditingController();
  TextEditingController fourthCodeController=TextEditingController();
  TextEditingController fifthCodeController=TextEditingController();
  TextEditingController sixthCodeController=TextEditingController();


  AutovalidateMode sendCodeAutoValidateMode=AutovalidateMode.disabled;

  activateSendCodeAutoValidateMode()
  {
    sendCodeAutoValidateMode=AutovalidateMode.always;
    emit(ActivateSendCodeAutoValidateModeState());
  }



  TextEditingController newPasswordController=TextEditingController();
  TextEditingController confirmNewPasswordController=TextEditingController();


  IconData newPasswordIcon=Icons.visibility_off;
  IconData confirmNewPasswordIcon=Icons.visibility_off;
  bool newPasswordObscure=true;
  bool confirmNewPasswordObscure=true;

  changeNewPasswordShape()
  {
    if(newPasswordIcon==Icons.visibility_off)
      {
        newPasswordObscure=false;
        newPasswordIcon=Icons.visibility;
      }
    else
      {
        newPasswordObscure=true;
        newPasswordIcon=Icons.visibility_off;
      }
    emit(ChangeNewPasswordSuffixIconState());
  }
  changeConfirmNewPasswordShape()
  {
    if(confirmNewPasswordIcon==Icons.visibility_off)
    {
      confirmNewPasswordObscure=false;
      confirmNewPasswordIcon=Icons.visibility;
    }
    else
    {
      confirmNewPasswordObscure=true;
      confirmNewPasswordIcon=Icons.visibility_off;
    }
    emit(ChangeConfirmNewPasswordSuffixIconState());
  }



  forgetPassSendCodeFun({required String email}) async
  {
    emit(ForgetPassSendCodeLoadingState());

    final response=await authRepoImplementation.forgetPasswordSendCode(
        email: email);

    response.fold((errorModel) => emit(ForgetPassSendCodeFailureState(errorModel: errorModel),),
        (message) =>emit(ForgetPassSendCodeSuccessState(message: message)));

  }

   AutovalidateMode verifyCodeAutoValidateMode=AutovalidateMode.disabled;

  activateVerifyCodeAutoValidateMode()
  {
    verifyCodeAutoValidateMode=AutovalidateMode.always;
    emit(ActivateVerifyCodeAutoValidateModeState());
  }
  forgetPassChangeWithCodeFun({required String email,required String code,required String password,required String confirmPassword}) async
  {
    emit(ForgetPassChangeWithCodeLoadingState());

    final response=await authRepoImplementation.forgetPassChangeWithCode(
        email: email,
        code: code,
        password: password,
        confirmPassword: confirmPassword);

    response.fold((errorModel) => emit(ForgetPassChangeWithCodeFailureState(errorModel: errorModel),),
            (message) =>emit(ForgetPassChangeWithCodeSuccessState(message: message)));


  }




}
