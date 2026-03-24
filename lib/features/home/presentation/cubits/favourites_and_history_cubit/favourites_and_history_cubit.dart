import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/get_meals_model/system_all_meals.dart';
import '../../../data/repos/home_repo_implementation.dart';
part 'favourites_and_history_state.dart';



class FavouritesAndHistoryCubit extends Cubit<FavouritesAndHistoryState> {
  FavouritesAndHistoryCubit({required this.homeRepoImplementation}) : super(FavouritesAndHistoryInitial());


   static FavouritesAndHistoryCubit get(context)=>BlocProvider.of(context);

   final HomeRepoImplementation homeRepoImplementation;


  List<SystemMeals> favouriteMealsList=[];
  List<SystemMeals> historyMealsList=[];

  changeFavouriteHeartShape({required List<SystemMeals> mealList,required int index}) async
  {
    mealList[index].itemIsSelected=!mealList[index].itemIsSelected;
    emit(ChangeMealFavouriteActiveShapeState());
  }

  Future<void> saveFavouriteMealToCache(List<SystemMeals> mealList, int index) async
  {
    await homeRepoImplementation.saveFavouriteMealToCache(meal: mealList[index]);
  }


  void getCachedFavouriteMeals()
  {
    final response= homeRepoImplementation.getCachedFavouriteMeals( );
    response.fold((exception)
    {
      emit(GetCachedFavouriteMealsFailureState());
    } , (success)
    {
      favouriteMealsList=success;
      emit(GetCachedFavouriteMealsSuccessState());
    },);

  }


  void getCachedHistoryMeals()
  {
    final response= homeRepoImplementation.getCachedHistoryMeals();
    response.fold((exception)
    {
      emit(GetCachedHistoryMealsFailureState());
    } , (success)
    {
      historyMealsList=success;
      emit(GetCachedHistoryMealsSuccessState());
    },);

  }

  removeOngoingFavouriteMeal({required SystemMeals meal,required int index}) async
  {
    homeRepoImplementation.removeOngoingFavouriteMeal(index: index);
    favouriteMealsList.remove(meal);
    emit(GetCachedFavouriteMealsSuccessState());
  }

  addToHistoryFavouriteMeal({required SystemMeals meal,required int index}) async
  {
    removeOngoingFavouriteMeal(meal: meal,index:index);
    await homeRepoImplementation.saveCachedHistoryMeals(meal: meal);
    emit(GetCachedFavouriteMealsSuccessState());
  }






}
