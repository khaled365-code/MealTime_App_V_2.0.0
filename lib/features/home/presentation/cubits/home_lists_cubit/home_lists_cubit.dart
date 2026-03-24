import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../data/models/all_categories_model/all_categories_model.dart';
import '../../../data/models/carousel_slider_data_model/carousel_slider_model.dart';

part 'home_lists_state.dart';

class HomeListsCubit extends Cubit<HomeListsState> {
  HomeListsCubit() : super(HomeListsInitial());

  static HomeListsCubit get(context)=> BlocProvider.of(context);

  List<CarouselSliderModel> carouselSliderList=[
    CarouselSliderModel(textTitle: 'becomeACulinary', btnText: 'seeMeals'),
    CarouselSliderModel(textTitle: 'craftYourCulinary', btnText: 'seeYourProfile'),
  ];


  List<AllCategoriesModel> allCategoriesList = [
    AllCategoriesModel(name: 'beef', image: ImageConstants.beefImage),
    AllCategoriesModel(name: 'chicken', image: ImageConstants.chickenImage),
    AllCategoriesModel(name: 'fish', image: ImageConstants.fishImage),
    AllCategoriesModel(name: 'seafood', image: ImageConstants.seafoodImage),
    AllCategoriesModel(name: 'pork', image: ImageConstants.porkImage),
    AllCategoriesModel(name: 'lamb', image: ImageConstants.lambImage),
    AllCategoriesModel(name: 'vegetarian', image: ImageConstants.vegetarianImage),
    AllCategoriesModel(name: 'vegan', image: ImageConstants.veganImage),
    AllCategoriesModel(name: 'glutenFree', image: ImageConstants.glutenFreeImage),
    AllCategoriesModel(name: 'dairyFree', image: ImageConstants.dairlyFreeImage),
    AllCategoriesModel(name: 'breakfast', image: ImageConstants.breakfastImage),
    AllCategoriesModel(name: 'lunch', image: ImageConstants.lunchImage),
    AllCategoriesModel(name: 'dinner', image: ImageConstants.dinnerImage),
    AllCategoriesModel(name: 'appetizers', image: ImageConstants.appetizaresImage),
    AllCategoriesModel(name: 'salads', image: ImageConstants.saladsImage),
    AllCategoriesModel(name: 'soups', image: ImageConstants.soupImage),
    AllCategoriesModel(name: 'sandwiches', image: ImageConstants.sandwichesImage),
    AllCategoriesModel(name: 'pasta', image: ImageConstants.pastaImage),
    AllCategoriesModel(name: 'pizza', image: ImageConstants.pizzaImage),
    AllCategoriesModel(name: 'riceDishes', image: ImageConstants.riceDishesImage),
    AllCategoriesModel(name: 'stirFries', image: ImageConstants.stirFriesImage),
    AllCategoriesModel(name: 'curries', image: ImageConstants.curriesImage),
    AllCategoriesModel(name: 'desserts', image: ImageConstants.dessertsImage),
    AllCategoriesModel(name: 'bakedGoods', image: ImageConstants.bakedGoodsImage),
    AllCategoriesModel(name: 'snacks', image: ImageConstants.snacksImage),
  ];


  int currentSelectedCategoryIndex=0;
  changeCurrentSelectedCategoryPosition({required int index})
  {
    currentSelectedCategoryIndex=index;
    emit(ChangeCurrentSelectedCategoryPositionState());
  }

}
