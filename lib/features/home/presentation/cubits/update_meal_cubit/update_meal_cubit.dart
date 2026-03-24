import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../../../core/commons/commons.dart';
import '../../../../../core/database/errors/error_model.dart';
import '../../../data/repos/home_repo_implementation.dart';

part 'update_meal_state.dart';

class UpdateMealCubit extends Cubit<UpdateMealState> {
  UpdateMealCubit({required this.homeRepoImplementation}) : super(UpdateMealInitial());

  static UpdateMealCubit get(context) => BlocProvider.of(context);

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
    emit(ChangeUpdatedCategoryValue());
  }


  XFile? updatedMealImage;

  updateMealImageFun({required XFile image})
  {
    updatedMealImage=image;
    emit(UpdateMealImageState());
  }

  deleteUpdatedMealImageFun()
  {
    updatedMealImage=null;
    emit(DeleteUpdatedMealImageState());
  }


  TextEditingController updateMealNameController=TextEditingController();
  TextEditingController updateMealDescriptionController=TextEditingController();
  TextEditingController updateMealPriceController=TextEditingController();

  updateMealFun({
    required String mealId,
    String? name,
    String? description,
    double? price,
    String? category,
    required XFile? newMealImage
  }) async
  {
    emit(UpdateMealLoadingState());
    var response= await homeRepoImplementation.updateMeal(
            mealId: mealId,
            name: name,
            description: description,
            price: price,
            category: category,
            mealImage: await uploadImageToAPI(newMealImage!));

    response.fold((errorModel)
    {
      emit(UpdateMealFailureState(errorModel: errorModel));
    }, (message)
    {
      emit(UpdateMealSuccessState(message: message));
    });



  }
}
