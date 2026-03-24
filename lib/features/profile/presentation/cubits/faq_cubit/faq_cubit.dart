import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/faq_screen_models/famous_qustions_model.dart';
import '../../../data/models/faq_screen_models/questions_and_answers_model.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

   static FaqCubit get(context) => BlocProvider.of(context);


  List<FamousQuestionsModel> famousQuestions =
  [
    FamousQuestionsModel(
        icon: ImageConstants.notificationQuestionIcon,
        questionTitle: 'gettingStarted',
        questionColor: AppColors.cE2F2FF),

    FamousQuestionsModel(
        icon: ImageConstants.howToInvestIcon,
        questionTitle: 'howToInvest',
        questionColor: AppColors.cEAFFED),

    FamousQuestionsModel(
        icon: ImageConstants.notificationQuestionIcon,
        questionTitle: 'notifications',
        questionColor: AppColors.cE2F2FF),
    
  ];


  List<QuestionsAndAnswersModel> originalQuestionsAndAnswersList =
  [

    QuestionsAndAnswersModel(
        question: 'canIAddMeals',
        answer: 'answer1'),
    QuestionsAndAnswersModel(
        question: 'whatShouldIfForgetPassword',
        answer: 'answer2'),
    QuestionsAndAnswersModel(
        question: 'howCanUpdateMeal',
        answer: 'answer3'),
    QuestionsAndAnswersModel(
        question: 'canChangeLanguagePreferences',
        answer: 'answer4'),

    QuestionsAndAnswersModel(
        question: 'whatTypesNotificationsAppOffer',
        answer: 'answer5'),

    QuestionsAndAnswersModel(
        question: 'howCanDeleteAccount',
        answer: 'answer6'),

    QuestionsAndAnswersModel(
        question: 'canIManageLocationSettings',
        answer: 'answer7'),

    QuestionsAndAnswersModel(
        question: 'canIViewMealsByOtherChefs',
        answer: 'answer8'),

    QuestionsAndAnswersModel(
        question: 'howCanIEditProfilePhoto',
        answer: 'answer9'),

    QuestionsAndAnswersModel(
        question: 'howDoILogout',
        answer: 'answer10'),

    QuestionsAndAnswersModel(
        question: 'whatHappensToMyCachingData',
        answer: 'answer11'),


  ];

  List<QuestionsAndAnswersModel> filteredQuestionsAndAnswersList = [];

  void initializeList()
  {
    filteredQuestionsAndAnswersList = List.from(originalQuestionsAndAnswersList);
    emit(FaqInitial());
  }


  filterMyList({required String searchQuery})
  {
    String query = searchQuery.toLowerCase();


    if (query.isEmpty)
    {
      filteredQuestionsAndAnswersList = List.from(originalQuestionsAndAnswersList);
    }
    else
    {

      filteredQuestionsAndAnswersList = originalQuestionsAndAnswersList
          .where((element) => element.question.toLowerCase().contains(query))
          .toList();
    }

    emit(FilterMyListState());
  }

}
