import 'package:bloc/bloc.dart';
import 'package:chef_app/features/profile/data/repos/profile_repo_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/commons/global_models/local_notifications_model.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit({required this.profileRepoImplementation}) : super(NotificationsInitial());


  static NotificationsCubit get(context)=>BlocProvider.of(context);

  final  ProfileRepoImplementation profileRepoImplementation;


  Future<void> saveLocalNotificationsFun({required LocalNotificationsModel localNotification}) async
  {
    await profileRepoImplementation.saveLocalNotification(localNotification: localNotification);
  }

  List<LocalNotificationsModel> localNotificationsList=[];
  getAllCachedNotificationsFun()
  {
    final response= profileRepoImplementation.getCachedLocalNotifications();

    response.fold((exception)
    {
      emit(GetLocalNotificationsFailureState(errorMessage: exception.toString()));
    } , (success)
    {
      localNotificationsList=success;
      emit(GetLocalNotificationsSuccessState());
    },);
  }

  deleteSpecificNotification({required int localNotificationId,required int index}) async
  {
    profileRepoImplementation.deleteNotification(localNotificationId: localNotificationId, index: index);
    localNotificationsList.removeAt(index);
    emit(GetLocalNotificationsSuccessState());

  }

  clearAllLocalNotifications() async
  {
    await profileRepoImplementation.clearAllNotifications();
    localNotificationsList.clear();
    emit(GetLocalNotificationsSuccessState());

  }



}
