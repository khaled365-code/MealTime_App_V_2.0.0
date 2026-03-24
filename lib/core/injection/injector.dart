
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_meal_time_app/core/commons/global_cubits/internet_checking_cubit.dart';
import 'package:new_meal_time_app/core/localization/localization_cubit/localization_cubit.dart';
import '../../features/auth/data/repos/auth_repo_implementation.dart';
import '../../features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import '../../features/home/data/repos/home_repo_implementation.dart';
import '../../features/home/presentation/cubits/add_meal_cubit/add_meal_cubit.dart';
import '../../features/home/presentation/cubits/favourites_and_history_cubit/favourites_and_history_cubit.dart';
import '../../features/home/presentation/cubits/get_chef_data_cubit/get_chef_data_cubit.dart';
import '../../features/home/presentation/cubits/get_system_meals_cubit/system_meals_cubit.dart';
import '../../features/home/presentation/cubits/update_meal_cubit/update_meal_cubit.dart';
import '../../features/profile/data/repos/profile_repo_implementation.dart';
import '../../features/profile/presentation/cubits/change_password_cubit/change_password_cubit.dart';
import '../../features/profile/presentation/cubits/delete_account_cubit/delete_account_cubit.dart';
import '../../features/profile/presentation/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import '../../features/profile/presentation/cubits/faq_cubit/faq_cubit.dart';
import '../../features/profile/presentation/cubits/get_specific_chef_meals_cubit/get_specific_chef_meals_cubit.dart';
import '../../features/profile/presentation/cubits/get_user_address_cubit/get_user_address_cubit.dart';
import '../../features/profile/presentation/cubits/logout_cubit/logout_cubit.dart';
import '../../features/profile/presentation/cubits/notifications_cubit/notifications_cubit.dart';
import '../../features/profile/presentation/cubits/settings_cubit/settings_cubit.dart';
import '../database/api/dio_consumer.dart';

GetIt locator=GetIt.instance;


setUpLocator()
{


  locator.registerLazySingleton<DioConsumer>(() =>DioConsumer(dio: Dio()),);
  locator.registerLazySingleton<HomeRepoImplementation>(() =>HomeRepoImplementation(api: locator.get<DioConsumer>()),);
  locator.registerLazySingleton<ProfileRepoImplementation>(() =>ProfileRepoImplementation(api: locator.get<DioConsumer>()));
  locator.registerLazySingleton<AuthRepoImplementation>(() =>AuthRepoImplementation(api: locator.get<DioConsumer>()),);

  locator.registerFactory(() => GetChefDataCubit(homeRepoImplementation: locator.get<HomeRepoImplementation>()),);
  locator.registerFactory(() => GetUserAddressCubit(),);
  locator.registerFactory(() => NotificationsCubit(profileRepoImplementation: locator.get<ProfileRepoImplementation>()),);
  locator.registerFactory(() => SystemMealsCubit(homeRepoImplementation: locator.get<HomeRepoImplementation>()),);
  locator.registerFactory(() => FavouritesAndHistoryCubit(homeRepoImplementation: locator.get<HomeRepoImplementation>()),);
  locator.registerFactory(() => GetSpecificChefMealsCubit(profileRepoImplementation: locator.get<ProfileRepoImplementation>()));
  locator.registerFactory(() => EditProfileCubit(profileRepoImplementation: locator.get<ProfileRepoImplementation>()),);
  locator.registerFactory(() => ChangePasswordCubit(profileRepoImplementation: locator.get<ProfileRepoImplementation>()),);
  locator.registerFactory(() => DeleteAccountCubit(profileRepoImplementation: locator.get<ProfileRepoImplementation>()),);
  locator.registerFactory(() => LogoutCubit(profileRepoImplementation: locator.get<ProfileRepoImplementation>()),);
  locator.registerFactory(() => UpdateMealCubit(homeRepoImplementation: locator.get<HomeRepoImplementation>()),);
  locator.registerFactory(() => AddMealCubit(homeRepoImplementation: locator.get<HomeRepoImplementation>()),);
  locator.registerFactory(() => LoginCubit(authRepoImplementation: locator.get<AuthRepoImplementation>()),);
  locator.registerFactory(() => SignupCubit(authRepoImplementation: locator.get<AuthRepoImplementation>()),);
  locator.registerFactory(() => ForgetPassCubit(authRepoImplementation: locator.get<AuthRepoImplementation>()),);
  locator.registerFactory(() => FaqCubit(),);
  locator.registerFactory(() => SettingsCubit(),);
  locator.registerFactory(() => LocalizationCubit(),);
  locator.registerFactory(() => InternetCheckingCubit(),);


}