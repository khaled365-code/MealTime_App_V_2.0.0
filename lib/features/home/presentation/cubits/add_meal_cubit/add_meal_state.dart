part of 'add_meal_cubit.dart';

@immutable
sealed class AddMealState {}

final class AddMealInitial extends AddMealState {}

final class ActivateAddMealValidateModeState extends AddMealState {}

final class ChangeCategoryValueState extends AddMealState {}

final class ChangeNumberRadioValueState extends AddMealState {}

final class ChangeQuantityRadioValueState extends AddMealState {}

final class AddMealPhotoChangedState extends AddMealState {}

final class DeleteMealPhotoState extends AddMealState {}


final class AddMealLoadingState extends AddMealState {}

final class AddMealSuccessState extends AddMealState {
  final AddMealModel addMealModel;

  AddMealSuccessState({required this.addMealModel});
}
final class AddMealFailureState extends AddMealState {

  final ErrorModel errorModel;

  AddMealFailureState({required this.errorModel});
}






