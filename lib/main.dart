import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_meal_time_app/firebase_options.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/injection/injector.dart';
import 'core/utils/services/local_notifications_service.dart';
import 'features/home/data/models/get_meals_model/system_all_meals.dart';
import 'features/profile/data/models/specific_chef_meals_model/chef_meals.dart';
import 'meal_time.dart';
import 'core/commons/global_models/local_notifications_model.dart';
import 'features/home/data/models/get_meals_model/chef_info.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    CacheHelper.init(),
    LocalNotificationsService.init(),
    Hive.initFlutter(),

  ]);
  Hive.registerAdapter(SystemMealsAdapter());
  Hive.registerAdapter(ChefDataAdapter());
  Hive.registerAdapter(LocalNotificationsModelAdapter());
  Hive.registerAdapter(SpecificChefMealsAdapter());
  await Future.wait([
    Hive.openBox<SystemMeals>('favourite_meals'),
    Hive.openBox<SystemMeals>('history_meals'),
    Hive.openBox<SystemMeals>('cached_system_meals'),
    Hive.openBox<SpecificChefMeals>('cached_chef_meals'),
    Hive.openBox<LocalNotificationsModel>('cached_local_notifications'),
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUpLocator();

  runApp( const MealTimeApp());
  Bloc.observer = MyBlocObserver();
}



