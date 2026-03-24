part of 'faq_cubit.dart';

@immutable
sealed class FaqState {}

final class FaqInitial extends FaqState {}

final class FilterMyListState extends FaqState {}
