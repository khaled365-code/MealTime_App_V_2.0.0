

import 'package:hive/hive.dart';

part 'local_notifications_model.g.dart';

@HiveType(typeId: 3)
class LocalNotificationsModel extends HiveObject
{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String body;
  @HiveField(3)
  final  String? image;
  @HiveField(4)
  final String? payload;
  @HiveField(5)
  final String notificationTime;

  LocalNotificationsModel(this.notificationTime, {this.payload,required this.id, required this.title, required this.body,this.image});

}