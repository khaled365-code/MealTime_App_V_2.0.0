import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/database/api/api_keys.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/injection/injector.dart';
import 'core/localization/app_localization.dart';
import 'core/localization/localization_cubit/localization_cubit.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';

class MealTimeApp extends StatelessWidget {
  const MealTimeApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<LocalizationCubit>(),
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) =>
              BlocBuilder<LocalizationCubit,LocalizationState>(
                builder: (context, state) {
                  return MaterialApp(
                    locale: Locale(CacheHelper().getData(key: ApiKeys.appCurrentLanguage)??
                        LocalizationCubit.get(context).currentLang),
                    localizationsDelegates: const
                    [
                      AppLocalizationDelegate(),
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: AppLocalization.supportedLocales,
                    localeResolutionCallback: (deviceLocale, supportedLocales)
                    {
                      for (var locale in supportedLocales) {
                        if (deviceLocale != null &&
                            deviceLocale.languageCode == locale.languageCode) {
                          return deviceLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                    debugShowCheckedModeBanner: false,
                    initialRoute: CacheHelper().getData(key: ApiKeys.token) !=
                        null
                        ? Routes.homeScreen
                        : Routes.splash2Screen,
                    onGenerateRoute: AppRouter.generateRoutes,
                  );
                },
              )),
    );
  }
}