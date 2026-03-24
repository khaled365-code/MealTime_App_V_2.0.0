part of 'system_meals_cubit.dart';

@immutable
sealed class SystemMealsState {}

final class SystemMealsInitial extends SystemMealsState {}

final class GetAllMealsLoadingState extends SystemMealsState {}
final class GetCachedMealsFailureState extends SystemMealsState {

}
final class GetCachedMealsSuccessState extends SystemMealsState {


}


final class GetAllMealsSuccessState extends SystemMealsState {

  final GetAllMealsModel getAllMealsModel;
  GetAllMealsSuccessState({required this.getAllMealsModel});
}


final class GetAllMealsFailureState extends SystemMealsState {

  final ErrorModel errorModel;
  GetAllMealsFailureState({required this.errorModel});
}