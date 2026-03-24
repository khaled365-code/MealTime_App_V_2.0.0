import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../core/commons/commons.dart';
import '../../../../../core/database/errors/error_model.dart';
import '../../../data/models/add_meal_model/add_meal_model.dart';
import '../../../data/repos/home_repo_implementation.dart';

part 'add_meal_state.dart';

class AddMealCubit extends Cubit<AddMealState> {
  AddMealCubit({required this.homeRepoImplementation}) : super(AddMealInitial());


  static AddMealCubit get(context)=>BlocProvider.of(context);

  final HomeRepoImplementation homeRepoImplementation;


  List<String>categoriesList=[
    'Beef',
    'Chicken',
    'Fish',
    'Seafood',
    'Pork',
    'Lamb',
    'Vegetarian',
    'Vegan',
    'Gluten-free',
    'Dairy-free',
    'Breakfast',
    'Lunch',
    'Dinner',
    'Appetizers',
    'Salads',
    'Soups',
    'Sandwiches',
    'Pasta',
    'Pizza',
    'Rice dishes',
    'Stir-fries',
    'Curries',
    'Desserts',
    'Baked goods',
    'Snacks'
  ];


  String selectedCategory='Beef';


  changeCategoryValue({required String value}){
    selectedCategory=value;
    emit(ChangeCategoryValueState());
  }

  bool numberRadioIsSelected=true;
  bool quantityRadioIsSelected=false;
  changeNumberRadioValue()
  {
    if(numberRadioIsSelected==true)
      {
        return ;
      }
    numberRadioIsSelected=true;
    quantityRadioIsSelected=false;
    emit(ChangeNumberRadioValueState());
  }
  changeQuantityRadioValue(){

    if(quantityRadioIsSelected==true)
    {
      return ;
    }
    numberRadioIsSelected=false;
    quantityRadioIsSelected=true;
    emit(ChangeQuantityRadioValueState());
  }


  XFile? mealImage;

  addMealPhoto({required XFile image})
  {
    mealImage = image;
    emit(AddMealPhotoChangedState());
  }

  deleteMealPhoto()
  {
    mealImage=null;
    emit(DeleteMealPhotoState());
  }

  GlobalKey<FormState> addMealFormKey=GlobalKey();
  AutovalidateMode addMealValidateMode=AutovalidateMode.disabled;

  activateAutoValidateMode()
  {
    addMealValidateMode=AutovalidateMode.always;
    emit(ActivateAddMealValidateModeState());
  }

  TextEditingController mealNameController=TextEditingController();
  TextEditingController mealDescriptionController=TextEditingController();
  TextEditingController mealPriceController=TextEditingController();
  TextEditingController mealHowToSellController=TextEditingController();

  addMealFun({required String name,required String description,required double price,required String category,required String howToSell}) async
  {
    emit(AddMealLoadingState());
    final response=await homeRepoImplementation.
    addNewMeal(
        name: name,
        description: description,
        price: price,
        category: category,
        howToSell: howToSell,
        image: await uploadImageToAPI(mealImage!));

    response.fold((errorModel) =>  emit(AddMealFailureState(errorModel: errorModel)),
        (addMealModel) => emit(AddMealSuccessState(addMealModel: addMealModel)));

  }


}
