import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> initNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('notification_icon');
  final IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings();

  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future scheduledNotification() async {
  var android = AndroidNotificationDetails('id', 'Reminders', channelDescription: 'Reminders for physics study');
  var ios = IOSNotificationDetails();
  var platform = NotificationDetails(android: android, iOS: ios);
  var interval = RepeatInterval.daily;
  final String textBody = notificationBody;
  await flutterLocalNotificationsPlugin.periodicallyShow(0, "",textBody , interval, platform,
  );
  print('notification activated: $textBody');
}

String get notificationBody  {
  List<String> bodyList = [
    'Time to study PHYSICS!',
    "It's PHYSICS time!",
    "Show PHYSICS some love!",
    "No PHYSICS No life",
    "Are you lonely? PHYSICS is waiting for you!",
    "PHYSICS is easy, if you spend time with it.",
    "No Pain No Gain.",
    "物理愛你~",
    "PHYSICS loves you!",
    "Let's fight for DSE!"
  ];
  return bodyList[Random().nextInt(bodyList.length)];
}



