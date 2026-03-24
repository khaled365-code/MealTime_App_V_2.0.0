



import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver
{

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('bloc $bloc is created');
  }
  @override
  void onChange(BlocBase bloc, Change change)
  {
    super.onChange(bloc, change);
    log('bloc $bloc is changed, To $change');

  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('bloc $bloc is closed');

  }

}