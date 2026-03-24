import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/database/errors/error_model.dart';
import '../../../data/repos/profile_repo_implementation.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit({required this.profileRepoImplementation}) : super(LogoutInitial());

    static LogoutCubit get(context)=>BlocProvider.of(context);
   final ProfileRepoImplementation profileRepoImplementation;


  logoutFun() async
  {
    emit(LogoutLoadingState());

    final response=await profileRepoImplementation.logOut();
    response.fold((errorModel) {
      emit(LogoutFailureState(errorModel: errorModel));
    }, (message) => emit(LogoutSuccessState(successMessage: message)));

  }
}
