
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_meal_time_app/core/routes/routes.dart';
import '../../features/auth/presentation/cubits/forget_pass_cubit/forget_pass_cubit.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import '../../features/auth/presentation/views/forget_pass_change_screen.dart';
import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/send_code_screen.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/home/presentation/cubits/add_meal_cubit/add_meal_cubit.dart';
import '../../features/home/presentation/cubits/favourites_and_history_cubit/favourites_and_history_cubit.dart';
import '../../features/home/presentation/cubits/get_chef_data_cubit/get_chef_data_cubit.dart';
import '../../features/home/presentation/cubits/get_system_meals_cubit/system_meals_cubit.dart';
import '../../features/home/presentation/cubits/home_lists_cubit/home_lists_cubit.dart';
import '../../features/home/presentation/cubits/update_meal_cubit/update_meal_cubit.dart';
import '../../features/home/presentation/views/add_meal_screen.dart';
import '../../features/home/presentation/views/all_meals_screen.dart';
import '../../features/home/presentation/views/favourites_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/home/presentation/views/meal_details_screen.dart';
import '../../features/home/presentation/views/update_meal_screen.dart';
import '../../features/profile/presentation/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import '../../features/profile/presentation/cubits/faq_cubit/faq_cubit.dart';
import '../../features/profile/presentation/cubits/get_specific_chef_meals_cubit/get_specific_chef_meals_cubit.dart';
import '../../features/profile/presentation/cubits/get_user_address_cubit/get_user_address_cubit.dart';
import '../../features/profile/presentation/cubits/notifications_cubit/notifications_cubit.dart';
import '../../features/profile/presentation/cubits/settings_cubit/settings_cubit.dart';
import '../../features/profile/presentation/views/certification_screen.dart';
import '../../features/profile/presentation/views/custom_drawer_screen.dart';
import '../../features/profile/presentation/views/edit_profile_screen.dart';
import '../../features/profile/presentation/views/faq_screen.dart';
import '../../features/profile/presentation/views/notifications_screen.dart';
import '../../features/profile/presentation/views/personal_info_screen.dart';
import '../../features/profile/presentation/views/settings_screen.dart';
import '../../features/profile/presentation/views/specific_chef_meals_screen.dart';
import '../../features/splash_and_onbording/presentation/views/onbaording_screen.dart';
import '../../features/splash_and_onbording/presentation/views/splash2_screen.dart';
import '../commons/global_cubits/internet_checking_cubit.dart';
import '../database/api/api_keys.dart';
import '../database/cache/cache_helper.dart';
import '../injection/injector.dart';

class AppRouter {

  static Route? generateRoutes(RouteSettings routeSettings)
  {

    switch (routeSettings.name)
    {
      case Routes.splash2Screen:
        return MaterialPageRoute(
            builder: (context) => Splash2Screen(),
            settings: routeSettings);

      case Routes.customDrawerScreen:
        return MaterialPageRoute(
            builder: (context) => CustomDrawerScreen(),
            settings: routeSettings);

      case Routes.faqScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => locator<FaqCubit>(),
              child: FaqScreen(),
            ),
            settings: routeSettings);

      case Routes.notificationsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => locator<NotificationsCubit>()..getAllCachedNotificationsFun(),
                  child: NotificationsScreen(),
                ),
            settings: routeSettings);

      case Routes.favouritesScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: routeSettings.arguments as FavouritesAndHistoryCubit,
              child: FavouritesScreen(),
            ),
            settings: routeSettings);

      case Routes.mainSettingsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => locator<SettingsCubit>(),
              child: MainSettingsScreen(),
            ),
            settings: routeSettings);

      case Routes.specificChefMealsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => locator<GetSpecificChefMealsCubit>()..generalGetChefMealsFun(
                  chefId: CacheHelper().getData(key: ApiKeys.id),context: context),
              child: SpecificChefMealsScreen(),
            ),
            settings: routeSettings);

      case Routes.editProfileScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => locator<EditProfileCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => locator<GetChefDataCubit>(),
                    ),
                  ],
                  child: EditProfileScreen(),
                ),
            settings: routeSettings);

      case Routes.certificationScreen:
        return MaterialPageRoute(
            builder: (context) => CertificationScreen(),
            settings: routeSettings);

      case Routes.personalInfoScreen:
        return MaterialPageRoute(
            builder: (context) => PersonalInfoScreen(),
            settings: routeSettings);

      case Routes.updateMealScreen:
        return MaterialPageRoute(
            builder: (context) =>
                MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => locator<UpdateMealCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => locator<NotificationsCubit>(),
                    ),
                  ],
                  child: UpdateMealScreen(),
                ),
            settings: routeSettings);

      case Routes.allMealsScreen:
        return MaterialPageRoute(
            builder: (context) =>
                MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => locator<FavouritesAndHistoryCubit>(),),
                    BlocProvider(
                      create: (context) => locator<SystemMealsCubit>()..generalGetMealsFun(context,false),
                    ),
                  ],
                  child: AllMealsScreen(),
                ),
            settings: routeSettings);

      case Routes.addMealScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => locator<AddMealCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => locator<NotificationsCubit>(),
                    ),
                  ],
                  child: AddMealScreen(),
                ),
            settings: routeSettings);
      case Routes.mealDetailsScreen:
        return MaterialPageRoute(
            builder: (context) => MealDetailsScreen(),
            settings: routeSettings);

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => OnboardingScreen(),
            settings: routeSettings);

      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (context) =>
                MultiBlocProvider(
                providers:
                [
                  BlocProvider(
                    lazy: false,
                    create: (context) => locator<GetUserAddressCubit>()..getUserAddressFun(),
                  ),

                  BlocProvider(
                      lazy: false,
                      create: (context) => locator<GetChefDataCubit>()
                      ..getChefDataFun(chefIId: CacheHelper().getData(key: ApiKeys.id)),),

                  BlocProvider(
                    create: (context) => locator<SystemMealsCubit>()
                      ..generalGetMealsFun(context, true),
                  ),

                  BlocProvider(
                    create: (context) => HomeListsCubit(),
                  ),
                ],
                child: HomeScreen(),),
            settings: routeSettings);

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => locator<LoginCubit>(),
                  child: LoginScreen(),
                ), settings: routeSettings);

      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => locator<SignupCubit>(),
                  child: SignupScreen(),
                ), settings: routeSettings);

      case Routes.forgetPassSendCodeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => locator<ForgetPassCubit>(),
              child: ForgetPasswordSendCodeScreen(),
            ),
            settings: routeSettings);

      case Routes.forgetPassChangeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => locator<ForgetPassCubit>(),
              child: ForgetPassChangeScreen(),
            ),
            settings: routeSettings);

      default:
        return MaterialPageRoute(builder: (context) => Scaffold(body: Text('No Screen'),),);
    }
  }

}