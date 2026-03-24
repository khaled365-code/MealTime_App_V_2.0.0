


import '../../../../../core/database/api/api_keys.dart';

class LoginModel
{
  final String message;
  final String token;

  LoginModel({required this.message, required this.token});


  factory LoginModel.fromJson(json)
  {
    return LoginModel(
        message: json[ApiKeys.message],
        token: json[ApiKeys.token]);
  }


}