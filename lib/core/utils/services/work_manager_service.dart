

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'local_notifications_service.dart';


class WorkManagerService
{
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
   static Workmanager workManager=Workmanager();


  static Future<void> init() async
  {
    await workManager.initialize(actionTask,isInDebugMode: true,);
    await registerTask();

  }



  static Future<void> registerTask() async
  {
    await workManager.registerPeriodicTask(
      'periodic scheduled daily notification at 12 AM',
      'periodic scheduled notification task at 12 AM',
      frequency: Duration(hours: 12),
    );
  }


  static Future<void> cancelTask({required String uniqueName}) async
  {
    await workManager.cancelByUniqueName(uniqueName);
  }

  static Future<void> cancelAllTasks() async
  {
    await workManager.cancelAll();
  }

}


@pragma('vm:entry-point')
 actionTask()
{
  Workmanager().executeTask((taskName, inputData) async
  {
    await LocalNotificationsService.showDailyScheduledNotification();
    return Future.value(true);
  },);
}