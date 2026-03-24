import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../core/commons/commons.dart';
import '../../../../../core/database/api/api_keys.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/database/errors/error_model.dart';
import '../../../data/repos/profile_repo_implementation.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.profileRepoImplementation}) : super(EditProfileInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);
  final ProfileRepoImplementation profileRepoImplementation;




  XFile? newProfilePhoto;


  updateProfilePhoto({required XFile image})
  {
    newProfilePhoto=image;
    emit(UpdateProfilePhotoState());
  }

  deleteProfilePhoto()
  {
    newProfilePhoto=null;
    emit(DeleteProfilePhotoState());
  }

  GlobalKey<FormState> editProfileFormKey = GlobalKey();
  AutovalidateMode editProfileValidateMode=AutovalidateMode.disabled;

  activateEditProfileValidateMode()
  {
    editProfileValidateMode=AutovalidateMode.always;
    emit(ActivateEditProfileValidateModeState());
  }
  TextEditingController nameController = TextEditingController(
    text: CacheHelper().getData(key: ApiKeys.name)
  );
  TextEditingController phoneController = TextEditingController(
    text: CacheHelper().getData(key: ApiKeys.phone)
  );
  TextEditingController brandNameController = TextEditingController(
    text: CacheHelper().getData(key: ApiKeys.brandName)
  );
  TextEditingController minChargeController = TextEditingController(
    text: CacheHelper().getData(key: ApiKeys.minCharge).toString()
  );
  TextEditingController discController = TextEditingController(
    text: CacheHelper().getData(key: ApiKeys.description)
  );


  editProfileFun({
     String? name,
     String? phone,
     String? brandName,
    double? minCharge,
     String? disc,}) async
  {
    emit(EditProfileLoadingState());
    final response=await profileRepoImplementation.updateProfile(
      name: name,
      phone: phone,
      brandName: brandName,
      minCharge: minCharge,
      disc: disc,
      profilePic: newProfilePhoto!=null? await uploadImageToAPI(newProfilePhoto!):null
    );

    response.fold((error)
    {
      emit(EditProfileFailureState(errorModel: error));
    }, (message)
    {
      emit(EditProfileSuccessState(message: message));
    },);


  }








}
