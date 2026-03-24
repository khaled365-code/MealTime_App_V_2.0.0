part of 'favourites_and_history_cubit.dart';

@immutable
sealed class FavouritesAndHistoryState {}

final class FavouritesAndHistoryInitial extends FavouritesAndHistoryState {}

final class ChangeMealFavouriteActiveShapeState extends FavouritesAndHistoryState {}

final class GetCachedFavouriteMealsFailureState extends FavouritesAndHistoryState {}

final class GetCachedFavouriteMealsSuccessState extends FavouritesAndHistoryState {}

final class GetCachedHistoryMealsFailureState extends FavouritesAndHistoryState {}


final class GetCachedHistoryMealsSuccessState extends FavouritesAndHistoryState {}
