part of 'delete_account_cubit.dart';

@immutable
sealed class DeleteAccountState {}

final class DeleteAccountInitial extends DeleteAccountState {}
final class DeleteMyAccountLoadingState extends DeleteAccountState {}

final class DeleteMyAccountSuccessState extends DeleteAccountState {

  final String successMessage;
  DeleteMyAccountSuccessState({required this.successMessage});
}


final class DeleteMyAccountFailureState extends DeleteAccountState {

  final ErrorModel errorModel;

  DeleteMyAccountFailureState({required this.errorModel});

}
