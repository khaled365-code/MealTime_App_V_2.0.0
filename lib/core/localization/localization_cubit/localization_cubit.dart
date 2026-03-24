import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../database/api/api_keys.dart';
import '../../database/cache/cache_helper.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());


 static LocalizationCubit get(context)=> BlocProvider.of(context);

  String currentLang='en';



  changeLanguageToArabic() async
  {
        currentLang='ar';
        await CacheHelper().saveData(key: ApiKeys.appCurrentLanguage, value: currentLang);
        emit(LanguageSwitchedToArabicState());

  }

  changeLanguageToEnglish() async
  {
        currentLang='en';
        await CacheHelper().saveData(key: ApiKeys.appCurrentLanguage, value: currentLang);
        emit(LanguageSwitchedToEnglishState());

  }



}
