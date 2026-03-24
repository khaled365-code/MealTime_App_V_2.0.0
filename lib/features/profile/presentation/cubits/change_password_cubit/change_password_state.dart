part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ActivateChangePasswordValidateModeState extends ChangePasswordState {}

final class ChangePasswordLoadingState extends ChangePasswordState {}
final class ChangePasswordFailureState extends ChangePasswordState {

  final ErrorModel errorModel;

  ChangePasswordFailureState({required this.errorModel});
}
final class ChangePasswordSuccessState extends ChangePasswordState {

  final String successMessage;
  ChangePasswordSuccessState({required this.successMessage});
}

final class ChangeOldPasswordIconState extends ChangePasswordState {}

final class ChangeNewPasswordIconState extends ChangePasswordState {}


final class ChangeConfirmPasswordIconState extends ChangePasswordState {}

