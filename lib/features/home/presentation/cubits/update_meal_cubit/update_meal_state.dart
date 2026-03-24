part of 'update_meal_cubit.dart';

@immutable
sealed class UpdateMealState {}

final class UpdateMealInitial extends UpdateMealState {}


final class UpdateMealLoadingState extends UpdateMealState {}


final class UpdateMealFailureState extends UpdateMealState {
  final ErrorModel errorModel;

  UpdateMealFailureState({required this.errorModel});

}
final class UpdateMealSuccessState extends UpdateMealState {
  final String message;
  UpdateMealSuccessState({required this.message});
}

final class UpdateMealImageState extends UpdateMealState {}


final class DeleteUpdatedMealImageState extends UpdateMealState {}

final class ChangeUpdatedCategoryValue extends UpdateMealState {}




