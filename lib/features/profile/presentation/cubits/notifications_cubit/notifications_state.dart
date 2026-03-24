part of 'notifications_cubit.dart';

@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}


final class LocationSwitchedState extends NotificationsState {}





final class GetLocalNotificationsFailureState extends NotificationsState {

  final String errorMessage;

  GetLocalNotificationsFailureState({required this.errorMessage});
}
final class GetLocalNotificationsSuccessState extends NotificationsState {


}