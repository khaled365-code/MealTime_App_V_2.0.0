
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/database/api/api_keys.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../../../core/widgets/no_internet_connection_dialog.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../home/presentation/cubits/get_chef_data_cubit/get_chef_data_cubit.dart';
import '../cubits/edit_profile_cubit/edit_profile_cubit.dart';
import '../widgets/edit_profile/brand_name_field.dart';
import '../widgets/edit_profile/description_field.dart';
import '../widgets/edit_profile/edit_profile_bar.dart';
import '../widgets/edit_profile/min_cahrge_field.dart';
import '../widgets/edit_profile/name_field.dart';
import '../widgets/edit_profile/phone_field.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit,EditProfileState>(
      listener: (context, state)
      {
        handleEditProfileListener(state, context);
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: BlocBuilder<EditProfileCubit, EditProfileState>(
                 builder: (context, state) {
                  return Form(
                    key: EditProfileCubit.get(context).editProfileFormKey,
                    autovalidateMode: EditProfileCubit.get(context).editProfileValidateMode,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 24.w, end: 24.w),
                      child: Column(
                        children: [
                          SpaceWidget(height: 32,),
                          EditProfileAppBar(),
                          SpaceWidget(height: 25,),
                          ImagePickerWidget(
                            imagePath: EditProfileCubit.get(context).newProfilePhoto?.path,
                            onGalleryTap: ()
                            {
                              imagePick(imageSource: ImageSource.gallery).then((value)
                                {
                                  EditProfileCubit.get(context).updateProfilePhoto(image: value!);
                                },
                              );
                              Navigator.pop(context);
                            },
                            onCameraTap: () {
                              imagePick(imageSource: ImageSource.camera).then((value)
                               {
                                  EditProfileCubit.get(context).updateProfilePhoto(image: value!);
                                },
                              );
                              Navigator.pop(context);
                            },
                            onDeletePhotoTap: ()
                            {
                              EditProfileCubit.get(context).deleteProfilePhoto();
                            },
                          ),
                          SpaceWidget(height: 30,),
                          EditProfileNameField(),
                          SpaceWidget(height: 24,),
                          EditProfilePhoneField(),
                          SpaceWidget(height: 24,),
                          EditProfileBrandNameField(),
                          SpaceWidget(height: 24,),
                          EditProfileMinChargeField(),
                          SpaceWidget(height: 24,),
                          EditProfileDescriptionField(),
                          Expanded(child: SpaceWidget(height: 32,)),
                          state is EditProfileLoadingState?
                          Center(
                            child: SharedLoadingIndicator(),
                          ):SharedButton(
                            btnText: 'save'.tr(context).toUpperCase(),
                            btnTextStyle: AppTextStyles.bold16(context)
                                .copyWith(color: AppColors.white),
                            onPressed: () async
                            {
                              if(await InternetConnectionCheckingService.checkInternetConnection()==true)
                                {
                                  if(EditProfileCubit.get(context).editProfileFormKey.currentState!.validate())
                                  {
                                    EditProfileCubit.get(context).editProfileFormKey.currentState!.save();
                                    EditProfileCubit.get(context).editProfileFun(
                                      name: EditProfileCubit.get(context).nameController.text,
                                      phone: EditProfileCubit.get(context).phoneController.text,
                                      brandName: EditProfileCubit.get(context).brandNameController.text,
                                      minCharge: EditProfileCubit.get(context).minChargeController.text.isNotEmpty? double.parse(EditProfileCubit.get(context).minChargeController.text):null,
                                      disc: EditProfileCubit.get(context).discController.text,
                                    );
                                  }
                                  else
                                  {
                                    EditProfileCubit.get(context).activateEditProfileValidateMode();
                                  }
                                }
                              else
                                {
                                  showDialog(context: context, builder: (context) => NoInternetConnectionDialog(),);
                                }

                            },
                          ),
                          Spacer(),
                        ],
                      )
                    ),);},),),


              ],
            )),
      ),
    );
  }

  void handleEditProfileListener(EditProfileState state, BuildContext context) async
  {
     if(state is EditProfileSuccessState)
      {
        buildScaffoldMessenger(
            context: context,
            msg: 'profileUpdatedSuccessfully'.tr(context),
            iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon));
        await GetChefDataCubit.get(context).getChefDataFun(chefIId: CacheHelper().getData(key: ApiKeys.id));
        navigate(context: context, route: Routes.homeScreen,replacement: true);

      }
    if(state is EditProfileFailureState)
      {
        if(state.errorModel.error!=null)
          {
            buildScaffoldMessenger(
                context: context,
                iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
                msg: state.errorModel.error.toString().substring(1,state.errorModel.error.toString().length-1));
          }
        else
          {
            buildScaffoldMessenger(
                context: context,
                iconWidget: Icon(Icons.error_outline,color: AppColors.white,size: 25.sp,),
                msg: state.errorModel.errorMessage!);
          }
      }
  }
}






