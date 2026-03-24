part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}
final class LogoutLoadingState extends LogoutState {}
final class LogoutFailureState extends LogoutState {
  final ErrorModel errorModel;

  LogoutFailureState({required this.errorModel});
}
final class LogoutSuccessState extends LogoutState {

  final String successMessage;
  LogoutSuccessState({required this.successMessage});
}
