import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/errors/error_model.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this.profileRepoImplementation}) : super(ChangePasswordInitial());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  final ProfileRepoImplementation profileRepoImplementation;



  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> changePasswordFormKey = GlobalKey();

  AutovalidateMode changePasswordAutoValidateMode = AutovalidateMode.disabled;

  activateChangePasswordAutoValidateMode()
  {
    changePasswordAutoValidateMode=AutovalidateMode.always;
    emit(ActivateChangePasswordValidateModeState());
  }

  IconData oldPasswordIcon = Icons.visibility_off;
  IconData newPasswordIcon = Icons.visibility_off;
  IconData confirmPasswordIcon = Icons.visibility_off;
  bool oldPasswordObscure = true;
  bool newPasswordObscure = true;
  bool confirmPasswordObscure = true;




  changeOldPasswordIconShape()
  {
    if(oldPasswordIcon==Icons.visibility_off)
      {
        oldPasswordIcon=Icons.visibility;
        oldPasswordObscure=false;
      }
    else
    {
      oldPasswordIcon=Icons.visibility_off;
      oldPasswordObscure=true;
    }
    emit(ChangeOldPasswordIconState());
  }

  changeNewPasswordIconShape()
  {

    if(newPasswordIcon==Icons.visibility_off)
      {
        newPasswordIcon=Icons.visibility;
        newPasswordObscure=false;
      }
    else
    {
      newPasswordIcon=Icons.visibility_off;
      newPasswordObscure=true;
    }
    emit(ChangeNewPasswordIconState());
  }

  changeConfirmPasswordIconShape()
  {

    if(confirmPasswordIcon==Icons.visibility_off)
      {
        confirmPasswordIcon=Icons.visibility;
        confirmPasswordObscure=false;
      }
    else
    {
      confirmPasswordIcon=Icons.visibility_off;
      confirmPasswordObscure=true;
    }
    emit(ChangeConfirmPasswordIconState());
  }


  changePasswordFun({required String oldPassword, required String newPassword, required String confirmPassword}) async
  {
    emit(ChangePasswordLoadingState());
    final response=await profileRepoImplementation.changePasswordForAccount(oldPassword: oldPassword, newPassword: newPassword, confirmPassword: confirmPassword);

    response.fold(
        (errorModel) => emit(ChangePasswordFailureState(errorModel: errorModel)),
        (successMessage) => emit(ChangePasswordSuccessState(successMessage: successMessage)));

  }



}
