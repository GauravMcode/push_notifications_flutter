part of 'notifications.dart';

class GroupNotification {
  final String groupKey = 'com.android.example.WORK_EMAIL';
  final String groupChannelId = 'grouped channel id';
  final String groupChannelName = 'grouped channel name';
  final String groupChannelDescription = 'grouped channel description';

  Future showNotification({int id = 2, List<String>? title, List<String>? body, List<String>? payload}) async {
    for (var i = 0; i < title!.length; i++) {
      _notification.show(id + i, title[i], body![i], await firstNotificationDetails());
    }
  }

  Future firstNotificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
      groupChannelId,
      groupChannelName,
      groupKey: groupKey,
      importance: Importance.max,
      priority: Priority.max,
    ));
  }
}
