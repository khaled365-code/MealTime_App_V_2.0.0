part of 'localization_cubit.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

final class LanguageSwitchedToArabicState extends LocalizationState {}

final class LanguageSwitchedToEnglishState extends LocalizationState {}


