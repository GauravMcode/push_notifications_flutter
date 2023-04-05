part of 'notifications.dart';

class SchedulePeriodicNotification {
  Future showNotification({int id = 100, String? title, String? body, String? payload}) async {
    return _notification.periodicallyShow(
      id, //identify notification uniquely
      title,
      body,
      RepeatInterval.everyMinute,
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
    );
  }

  stopNotifications() {
    _notification.cancel(100);
  }
}

class ScheduleZonedNotification {
  Future showNotification({int id = 100, String? title, String? body, String? payload}) async {
    tz.initializeTimeZones();
    var timeNow = DateTime.now();
    var dateTime = DateTime(timeNow.year, timeNow.month, timeNow.day, timeNow.hour, 21, 0);

    return _notification.zonedSchedule(
      id, //identify notification uniquely
      title,
      body,
      tz.TZDateTime.from(dateTime, tz.local),
      await _notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
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
    );
  }
}
