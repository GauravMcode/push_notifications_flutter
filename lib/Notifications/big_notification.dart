part of 'notifications.dart';

class BigNotification {
  final String _contentTitle;
  late BigPictureStyleInformation bigNotification;

  BigNotification(this._contentTitle) {
    bigNotification = BigPictureStyleInformation(
      const DrawableResourceAndroidBitmap('flutter_logo'),
      contentTitle: _contentTitle,
      largeIcon: const DrawableResourceAndroidBitmap('flutter_logo'),
    );
  }

  Future showNotification({int id = 1, String? title, String? body, String? payload}) async {
    return _notification.show(
      id, //identify notification uniquely
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
  }

  Future _notificationDetails() async {
    //specify how the notification will look like in android and ios
    return NotificationDetails(
      android: AndroidNotificationDetails(
        //in android, our notification  is linked to a channel
        'big_picture channel id',
        'big_picture channel name',
        channelDescription: 'channel_big.description',
        styleInformation: bigNotification,
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }
}
