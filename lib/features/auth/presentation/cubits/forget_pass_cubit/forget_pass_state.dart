part of 'forget_pass_cubit.dart';

@immutable
sealed class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class ActivateSendCodeAutoValidateModeState extends ForgetPassState {}

final class ActivateVerifyCodeAutoValidateModeState extends ForgetPassState {}

final class ForgetPassSendCodeLoadingState extends ForgetPassState {}


final class ForgetPassSendCodeFailureState extends ForgetPassState {

  final ErrorModel errorModel;

  ForgetPassSendCodeFailureState({required this.errorModel});
}

final class ForgetPassSendCodeSuccessState extends ForgetPassState {

  final String message;

  ForgetPassSendCodeSuccessState({required this.message});
}

final class ForgetPassChangeWithCodeLoadingState extends ForgetPassState {}


final class ForgetPassChangeWithCodeSuccessState extends ForgetPassState {

  final String message;
  ForgetPassChangeWithCodeSuccessState({required this.message});

}

final class ForgetPassChangeWithCodeFailureState extends ForgetPassState {

  final ErrorModel errorModel;
  ForgetPassChangeWithCodeFailureState({required this.errorModel});
}


final class ChangeNewPasswordSuffixIconState extends ForgetPassState {}


final class ChangeConfirmNewPasswordSuffixIconState extends ForgetPassState {}








