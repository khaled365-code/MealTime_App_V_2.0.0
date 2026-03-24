import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/database/errors/error_model.dart';
import '../../../data/models/login_model/login_model.dart';
import '../../../data/repos/auth_repo_implementation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepoImplementation}) : super(LoginInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);

  AutovalidateMode loginAutoValidateMode=AutovalidateMode.disabled;

  changeValidateMode()
  {
    loginAutoValidateMode=AutovalidateMode.always;
    emit(ChangeLoginValidateModeState());
  }

  AuthRepoImplementation authRepoImplementation;

  TextEditingController emailController=TextEditingController(
    text:  CacheHelper().getData(key: ApiKeys.savedEmail)??'',
  );
  TextEditingController passwordController=TextEditingController(
    text:  CacheHelper().getData(key: ApiKeys.savedPassword)??'',
  );

  GlobalKey<FormState> loginFormKey=GlobalKey();


  IconData suffixIcon=Icons.visibility_off;
  bool isObsecureText=true;

  changeEyeShape()
  {
    if(suffixIcon==Icons.visibility_off)
    {
      suffixIcon=Icons.visibility;
      isObsecureText=false;
    }
    else
    {
      suffixIcon=Icons.visibility_off;
      isObsecureText=true;
    }

    emit(ChangePasswordEyeShape());

  }


 loginFun({required String email,required String password}) async
 {
   emit(LoginLoadingState());
   final response=await authRepoImplementation.login(
       email: email,
       password: password);

   response.fold((errorModel) => emit(LoginFailureState(theError: errorModel)),
         (successMessage) => emit(LoginSuccessState(successLoginModel: successMessage)),);

 }

  bool isAccountRemembered=false;
  changeCheckBoxShape()
  {
    isAccountRemembered=!isAccountRemembered;
    emit(ChangeCheckBoxShapeState());
  }

  Future<void> rememberMeFun({required String email,required String password}) async
  {
    if(isAccountRemembered==true)
    {
      if(emailController.text.isNotEmpty&&passwordController.text.isNotEmpty)
      {
        await CacheHelper().saveData(key: ApiKeys.savedEmail, value: email);
        await CacheHelper().saveData(key: ApiKeys.savedPassword, value: password);
      }
    }
    if(isAccountRemembered==false)
      {
        await CacheHelper().removeData(key: ApiKeys.savedEmail);
        await CacheHelper().removeData(key: ApiKeys.savedPassword);
      }

  }







}
