
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/commons/global_models/local_notifications_model.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/utils/services/local_notifications_service.dart';
import '../../../../core/widgets/no_internet_connection_dialog.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../../core/widgets/name_and_text_field_widget.dart';
import '../../../profile/presentation/cubits/notifications_cubit/notifications_cubit.dart';
import '../../data/models/get_meals_model/system_all_meals.dart';
import '../cubits/update_meal_cubit/update_meal_cubit.dart';
import '../widgets/add_meal_photo_widget.dart';
import '../widgets/update_meal/app_bar_update_screen.dart';
import '../widgets/update_meal/update_description_field_widget.dart';
import '../widgets/update_meal/update_meal_name_widget.dart';
import '../widgets/update_meal/update_price_field_widget.dart';


class UpdateMealScreen extends StatelessWidget
{
  const UpdateMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var receivedMeal=ModalRoute.of(context)!.settings.arguments as SystemMeals;
        return BlocListener<UpdateMealCubit,UpdateMealState>(
          listener: (context, state)
          {
            handleUpdateMealListener(state, context,receivedMeal);
          },
  child: Scaffold(
    backgroundColor: AppColors.white,
          body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpaceWidget(height: 32,),
                        UpdateScreenAppBar(),
                        SpaceWidget(height: 24,),
                        BlocBuilder<UpdateMealCubit, UpdateMealState>
                          (builder: (context, state){
                            return AddMealPhotoWidget(
                            specificUpdateText: 'update'.tr(context),
                            onDeletePhotoPressed: ()
                            {
                              UpdateMealCubit.get(context).deleteUpdatedMealImageFun();
                            },
                            imagePath: UpdateMealCubit.get(context).updatedMealImage?.path,
                            onCameraTap: ()
                            {
                              imagePick(imageSource: ImageSource.camera).then(
                                    (value) =>
                                        UpdateMealCubit.get(context).updateMealImageFun(image: value!),
                              );
                              Navigator.pop(context);
                            },
                            onGalleryTap: ()
                            {
                              imagePick(imageSource: ImageSource.gallery).then(
                                    (value) =>
                                        UpdateMealCubit.get(context).updateMealImageFun(image: value!),
                              );
                              Navigator.pop(context);
                            },
                          );
                        }),
                         SpaceWidget(height: UpdateMealCubit.get(context).updatedMealImage == null ? 24 : 5,),
                         UpdateMealNameField(updateMealCubit: UpdateMealCubit.get(context)),
                        SpaceWidget(height: 24,),
                        UpdatePriceField(updateMealCubit: UpdateMealCubit.get(context)),
                        SpaceWidget(height: 24,),
                        UpdateDescriptionField(updateMealCubit: UpdateMealCubit.get(context)),
                        SpaceWidget(height: 24,),
                        BlocBuilder<UpdateMealCubit, UpdateMealState>(
                            builder: (context,state){
                              return NameAndTextFieldWidget(
                                  title: 'newCategory'.tr(context),
                                  childWidget: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.cF0F5FA,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                                canvasColor: Colors.transparent, // background color for the dropdown items
                                                buttonTheme: ButtonTheme.of(context).copyWith(
                                                  alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                                                )),
                                            child: DropdownButton(
                                              items: UpdateMealCubit.get(context).categoriesList.map(
                                                    (e) =>
                                                    DropdownMenuItem(
                                                        value: e,
                                                        child: Text(e.tr(context), style: AppTextStyles.regular14(context).copyWith(
                                                          color: AppColors.cA0A5BA
                                                      ),)),
                                              ).toList(),
                                              onChanged: (value)
                                              {
                                                UpdateMealCubit.get(context).changeCategoryValue(value: value.toString());
                                              },
                                              icon: SvgPicture.asset(ImageConstants.underArrowIcon),
                                              value: UpdateMealCubit.get(context).selectedCategory,
                                              isExpanded: true,
                                              dropdownColor: AppColors.cF0F5FA,
                                              elevation: 0,
                                              underline: SizedBox.shrink(),
                                              padding: EdgeInsetsDirectional.only(
                                                  start: 5.w,
                                                  end: 16.w
                                              ),
                                              menuMaxHeight: 200.h,
                                            ),
                                          ),

                                        ),
                                      ],
                                    ),
                                  ));
                            }),
                        SpaceWidget(height: 24,),
                      ],
                    ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 121.h,
                        ),),
                        BlocBuilder<UpdateMealCubit, UpdateMealState>(
                            builder: (context,state){
                              if(state is UpdateMealLoadingState)
                                {
                                  return Center(
                                    child: SharedLoadingIndicator(),);
                                }
                              else
                                {
                                  return SharedButton(
                                    btnText: 'updateThisMeal'.tr(context),
                                    btnTextStyle: AppTextStyles.bold16(context)
                                        .copyWith(
                                        color: AppColors.white
                                    ),
                                    onPressed: () async
                                    {
                                      await updateMealFun(context, receivedMeal);
                                    },);}
                            },),
                        SpaceWidget(height: 32,)

                      ],
                    ),
                  )

                ],
              )),
        ),
);
  }

  void handleUpdateMealListener(UpdateMealState state, BuildContext context,SystemMeals receivedMeal) async
  {
     if (state is UpdateMealSuccessState)
    {
      var imagePath= await getImagePathFromUrl(receivedMeal.images![0]);
      LocalNotificationsModel localNotificationsModel=LocalNotificationsModel(
        DateTime.now().toString(),
        id: 55,
        image: ImageConstants.newMealAlarmImage,
        payload: UpdateMealCubit.get(context).updatedMealImage?.path??imagePath,
        title: '${receivedMeal.name}'+' '+ 'mealUpdatedSuccessfully'.tr(context) + '${UpdateMealCubit.get(context).updateMealNameController.text.isEmpty?'':'to'.tr(context)+ ' ${UpdateMealCubit.get(context).updateMealNameController.text}'}',
        body: 'detailsModified'.tr(context)
      );
     await LocalNotificationsService.showBasicNotification(localNotificationsModel: localNotificationsModel);
     await NotificationsCubit.get(context).saveLocalNotificationsFun(localNotification: localNotificationsModel);
     UpdateMealCubit.get(context).updateMealNameController.clear();
     UpdateMealCubit.get(context).updateMealDescriptionController.clear();
     UpdateMealCubit.get(context).updateMealPriceController.clear();
      UpdateMealCubit.get(context).updatedMealImage=null;
     Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => true,);
    }
    if (state is UpdateMealFailureState)
    {
      if (state.errorModel.error != null)
      {

        buildScaffoldMessenger(
            context: context,
            iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
             msg: state.errorModel.error!.toString().substring(1,
                state.errorModel.error!.toString().length - 1));
      }
      else
      {
        buildScaffoldMessenger(
            iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
            context: context,
            msg: state.errorModel.errorMessage!);
      }
    }
  }


  Future<void> updateMealFun(BuildContext context, SystemMeals receivedMeal) async
  {
    if(await InternetConnectionCheckingService.checkInternetConnection()==true)
      {
        if( UpdateMealCubit.get(context).updatedMealImage == null &&
            UpdateMealCubit.get(context).updateMealNameController.text.isEmpty
            && UpdateMealCubit.get(context).updateMealDescriptionController.text.isEmpty
            && UpdateMealCubit.get(context).updateMealPriceController.text.isEmpty
            && UpdateMealCubit.get(context).selectedCategory == 'Beef')
        {
          showToast(
            context: context,
              msg: 'nothingToUpdate'.tr(context),
              toastStates: ToastStates.error,
              gravity: ToastGravity.CENTER);
        }
        else
        {
          XFile mealImage = await getImageXFileByUrl(receivedMeal.images![0]);
          UpdateMealCubit.get(context).updateMealFun(
              mealId: receivedMeal.id!,
              name: UpdateMealCubit.get(context).updateMealNameController.text.isEmpty?receivedMeal.name: UpdateMealCubit.get(context).updateMealNameController.text,
              price: UpdateMealCubit.get(context).updateMealPriceController.text.isNotEmpty?double.parse(UpdateMealCubit.get(context).updateMealPriceController.text):double.parse(receivedMeal.price.toString()),
              description: UpdateMealCubit.get(context).updateMealDescriptionController.text.isEmpty?receivedMeal.description: UpdateMealCubit.get(context).updateMealDescriptionController.text,
              category: UpdateMealCubit.get(context).selectedCategory,
              newMealImage:  UpdateMealCubit.get(context).updatedMealImage==null? mealImage : UpdateMealCubit.get(context).updatedMealImage
          );
        }
      }
    else
      {
        showDialog(context: context, builder: (context) => NoInternetConnectionDialog(),);
      }

  }
}



