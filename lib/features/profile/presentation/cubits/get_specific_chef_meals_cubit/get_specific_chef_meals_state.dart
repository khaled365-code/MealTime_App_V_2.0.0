part of 'get_specific_chef_meals_cubit.dart';

@immutable
sealed class GetSpecificChefMealsState {}

final class GetSpecificChefMealsInitial extends GetSpecificChefMealsState {}
final class GetSpecificChefMealsLoadingState extends GetSpecificChefMealsState {}


final class GetSpecificChefMealsSuccessState extends GetSpecificChefMealsState {

  final SpecificChefMealsModel specificChefMealsModel;

  GetSpecificChefMealsSuccessState({required this.specificChefMealsModel});
}



final class GetSpecificChefMealsFailureState extends GetSpecificChefMealsState
{

  final ErrorModel errorModel;

  GetSpecificChefMealsFailureState({required this.errorModel});

}

final class GetCachedChefMealsSuccessState extends GetSpecificChefMealsState {}

final class GetCachedChefMealsFailureState extends GetSpecificChefMealsState {}

