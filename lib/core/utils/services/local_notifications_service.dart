
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:path_provider/path_provider.dart';
import '../../commons/global_models/local_notifications_model.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../commons/global_models/scheduled_notification_model.dart';



class LocalNotificationsService
{

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();


  static StreamController<NotificationResponse> localNotificationsStreamController=StreamController();

  static  onNotificationTappedFun(NotificationResponse response)
  {
    localNotificationsStreamController.add(response);
  }
  static Future<void> init() async
  {
   await flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings(
          '@mipmap/ic_launcher',
        ),
        iOS: DarwinInitializationSettings(),
      ),
     onDidReceiveNotificationResponse: onNotificationTappedFun,
     onDidReceiveBackgroundNotificationResponse: onNotificationTappedFun
    );
  }


  static Future<void> showBasicNotification({required LocalNotificationsModel localNotificationsModel}) async
  {
    var imageData = await getNotificationImage(localNotificationsModel);


    NotificationDetails notificationDetails=NotificationDetails(
      android: AndroidNotificationDetails(
          '1',
          'basic notification',
           playSound: true,
        priority: Priority.max,
        importance: Importance.high,
        sound: RawResourceAndroidNotificationSound('meal_time_app_notification'),
        styleInformation: imageData,

      ),
      iOS: DarwinNotificationDetails()
    );
    await flutterLocalNotificationsPlugin.show(
        localNotificationsModel.id,
        localNotificationsModel.title,
        localNotificationsModel.body,
        payload: localNotificationsModel.payload,
        notificationDetails);

  }

  static getNotificationImage(LocalNotificationsModel localNotificationsModel) async
  {
    if(localNotificationsModel.image!=null)
    {
      // Load image from assets and store it in a temporary directory
      final ByteData imageData = await rootBundle.load(localNotificationsModel
          .image!); // Replace with your actual image path in assets
      final Directory tempDir = await getTemporaryDirectory();
      final String tempImagePath = '${tempDir.path}/${localNotificationsModel
          .image!.split('images/').last}'; // Temporary path to save the image

      // Save the image as a file
      final File tempFile = File(tempImagePath);
      await tempFile.writeAsBytes(imageData.buffer.asUint8List(
          imageData.offsetInBytes, imageData.lengthInBytes));

      final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
        FilePathAndroidBitmap(tempImagePath), // Load the saved image file
        contentTitle: localNotificationsModel.title,
        summaryText: localNotificationsModel.body,
      );

      return bigPictureStyleInformation;
    }
    else
      {
        return null;
      }
  }


  static Future<void> showRepeatedNotification({required LocalNotificationsModel localNotificationsModel,required RepeatInterval repeatedInterval}) async
  {
    var imageData = await getNotificationImage(localNotificationsModel);

    NotificationDetails notificationDetails=NotificationDetails(
        android: AndroidNotificationDetails(
          '2',
          'repeated notification',
          playSound: true,
          priority: Priority.max,
          importance: Importance.high,
            sound: RawResourceAndroidNotificationSound('meal_time_app_notification'),
            styleInformation: imageData
        ),
        iOS: DarwinNotificationDetails()
    );
   await  flutterLocalNotificationsPlugin.periodicallyShow(
        localNotificationsModel.id,
        localNotificationsModel.title,
        localNotificationsModel.body,
        repeatedInterval,
        payload: localNotificationsModel.payload,
        notificationDetails);
  }


  static Future<void> showScheduledNotification({
    required LocalNotificationsModel localNotificationsModel,
    required ScheduledNotificationModel scheduledNotificationModel}) async
  {
    var imageData = await getNotificationImage(localNotificationsModel);

    NotificationDetails notificationDetails=NotificationDetails(
        android: AndroidNotificationDetails(
          '100',
          'scheduled notification',
          playSound: true,
          priority: Priority.max,
          importance: Importance.high,
          sound: RawResourceAndroidNotificationSound('meal_time_app_notification'),
          styleInformation: imageData,
        ),
        iOS: DarwinNotificationDetails()
    );
    UILocalNotificationDateInterpretation uiLocalNotificationDateInterpretation
    =UILocalNotificationDateInterpretation.absoluteTime;

    await setCurrentDeviceLocation();
   await flutterLocalNotificationsPlugin.zonedSchedule(
        localNotificationsModel.id,
        localNotificationsModel.title,
        localNotificationsModel.body,
       tz.TZDateTime(
        tz.local,
          scheduledNotificationModel.year,
          scheduledNotificationModel.month,
          scheduledNotificationModel.day,
          scheduledNotificationModel.hour,
          scheduledNotificationModel.minute,
          scheduledNotificationModel.second??0,
   ),
        notificationDetails,
        uiLocalNotificationDateInterpretation: uiLocalNotificationDateInterpretation,
     payload: localNotificationsModel.payload,
     // matchDateTimeComponents: DateTimeComponents.time,  // Ensures it fires daily at the same time
   );

  }


  static Future<void> setCurrentDeviceLocation() async
  {
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    log(currentTimeZone);
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
  }

  static Future<void> cancelSpecificNotification({required int id}) async
  {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future<void> cancelAllNotifications() async
  {
    await flutterLocalNotificationsPlugin.cancelAll();
  }


  static Future<void> showDailyScheduledNotification() async
  {
    NotificationDetails notificationDetails=NotificationDetails(
        android: AndroidNotificationDetails(
          '22',
          'periodic daily scheduled notification',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          sound: RawResourceAndroidNotificationSound('meal_time_app_notification'),
        ),
        iOS: DarwinNotificationDetails()
    );
    UILocalNotificationDateInterpretation uiLocalNotificationDateInterpretation=UILocalNotificationDateInterpretation.absoluteTime;
    await setCurrentDeviceLocation();
    // كل يوم الساعه 12 يكون فيه scheduled Notification very important
    var currentTime=tz.TZDateTime.now(tz.local);
    log(currentTime.toString());
    var scheduledTime= tz.TZDateTime(
        tz.local,
        currentTime.year,
        currentTime.month,
        currentTime.day,
        24,
        0,
        0,
        0,
        0
    );
    if(scheduledTime.isBefore(currentTime))
    {
      scheduledTime=scheduledTime.add(Duration(days: 1));
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
      14,
      'Time for a Tasty Treat!',
      'Discover new meals added today! Check out the latest recipes from our chefs or add your own to the collection',
      scheduledTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation: uiLocalNotificationDateInterpretation,
      matchDateTimeComponents: DateTimeComponents.time,  // Ensures it fires daily at the same time

    );
  }



}