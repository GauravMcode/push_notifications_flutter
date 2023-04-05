import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
part 'big_notification.dart';
part 'group_notification.dart';
part 'schedule_notification.dart';

final notification = FlutterLocalNotificationsPlugin();
Future initialize() async {
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('flutter_logo');
  //'flutter_logo' ->inside the android>app>src>main>res>drawable folder.

  const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  await notification.initialize(initializationSettings, onDidReceiveNotificationResponse: (details) async {
    final String? payload = details.payload;
  });
}

class SimpleNotificataion {
  Future showNotification({int id = 0, String? title, String? body, String? payload}) async {
    return notification.show(
      id, //identify notification uniquely
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
  }

  Future _notificationDetails() async {
    //specify how the notification will look like in android and ios
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          //in android, our notification  is linked to a channel
          'channel id',
          'channel name',
          channelDescription: 'channel.description',
          icon: 'flutter_logo',
          largeIcon: DrawableResourceAndroidBitmap('flutter_logo'),
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails());
  }
}
