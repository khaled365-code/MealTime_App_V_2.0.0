import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/database/errors/error_model.dart';
import '../../../../../core/utils/services/internet_connection_service.dart';
import '../../../data/models/chef_info_model/chef_info_model.dart';
import '../../../data/repos/home_repo_implementation.dart';

part 'get_chef_data_state.dart';

class GetChefDataCubit extends Cubit<GetChefDataState> {
  GetChefDataCubit({required this.homeRepoImplementation}) : super(GetChefDataInitial());

  static GetChefDataCubit get(context)=>BlocProvider.of(context);
  final HomeRepoImplementation homeRepoImplementation;

  getChefDataFun({required String chefIId}) async
  {
    if(await InternetConnectionCheckingService.checkInternetConnection()==true)
      {
        log('get chef data is triggered');
        emit(GetChefDataLoadingState());
        final response=await homeRepoImplementation.getChefData(chefIId: chefIId);
        response.fold(
                (errorModel) => emit(GetChefDataErrorState(errorModel: errorModel)),
                (chefInfoModel) => emit(GetChefDataSuccessState(chefInfoModel: chefInfoModel )));
      }
  }








}
