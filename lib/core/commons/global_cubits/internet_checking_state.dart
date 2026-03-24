part of 'internet_checking_cubit.dart';

@immutable
sealed class InternetCheckingState {}

final class InternetCheckingInitial extends InternetCheckingState {}


final class InternetIsConnectedState extends InternetCheckingState {

  final String message;

  InternetIsConnectedState({required this.message});
}


final class InternetNotConnectedState extends InternetCheckingState {

  final String message;

  InternetNotConnectedState({required this.message});

}
