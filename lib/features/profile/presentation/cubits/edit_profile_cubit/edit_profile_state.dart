part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class ActivateEditProfileValidateModeState extends EditProfileState {}

final class UpdateProfilePhotoState extends EditProfileState {}


final class DeleteProfilePhotoState extends EditProfileState {}

final class EditProfileLoadingState extends EditProfileState {}
final class EditProfileSuccessState extends EditProfileState
{

  final String message;
  EditProfileSuccessState({required this.message});

}
final class EditProfileFailureState extends EditProfileState {

  final ErrorModel errorModel;
  EditProfileFailureState({required this.errorModel});
}

