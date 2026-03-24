part of 'home_lists_cubit.dart';

@immutable
sealed class HomeListsState {}

final class HomeListsInitial extends HomeListsState {}

final class ChangeCurrentSelectedCategoryPositionState extends HomeListsState {}
