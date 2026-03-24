import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meta/meta.dart';
part 'internet_checking_state.dart';


class InternetCheckingCubit extends Cubit<InternetCheckingState> {
  InternetCheckingCubit() : super(InternetCheckingInitial());


  StreamSubscription? internetConnectionStream;

  static InternetCheckingCubit get(context)=>BlocProvider.of(context);

  checkStreamConnection()
  {

    internetConnectionStream=InternetConnection().onStatusChange.listen((InternetStatus status)
    {
      if(status==InternetStatus.connected)
        {
          connected();
        }
      else if(status==InternetStatus.disconnected)
        {
          notConnected();
        }
    },);
  }


  void connected()
  {
    emit(InternetIsConnectedState(message: 'Internet is Connected'));
  }

  void notConnected()
  {
    emit(InternetNotConnectedState(message: 'You are offline'));
  }

  @override
  Future<void> close()
  {
   internetConnectionStream?.cancel();
    return super.close();
  }



}
