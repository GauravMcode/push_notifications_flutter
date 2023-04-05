part of 'main.dart';

class BigNotificationButton extends StatelessWidget {
  const BigNotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Big Notification'),
    );
  }
}

enum NotificationType { simple, big, group, schedule, cancel, zoned }

class NotificationButton extends StatelessWidget {
  final String text;
  final NotificationType type;
  const NotificationButton({super.key, required this.text, required this.type});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        switch (type) {
          case NotificationType.simple:
            SimpleNotificataion().showNotification(title: 'Hello Gaurav!', body: 'How have you been doing Today?', payload: 'gaurav.msg');
            break;
          case NotificationType.big:
            BigNotification('Hello Message').showNotification(title: 'Hello Gaurav!', body: 'How have you been doing Today?', payload: 'gaurav.msg');
            break;
          case NotificationType.group:
            final titles = ['first message', 'second message'];
            final bodies = ['This is the first message', 'This is the second message'];
            GroupNotification().showNotification(title: titles, body: bodies, payload: ['first.msg', 'second.msg']);
            break;
          case NotificationType.schedule:
            SchedulePeriodicNotification().showNotification(title: 'Hello Gaurav!', body: 'This is a Scheduled Notification', payload: 'gaurav.msg');
            break;
          case NotificationType.cancel:
            SchedulePeriodicNotification().stopNotifications();
            break;
          case NotificationType.zoned:
            ScheduleZonedNotification().showNotification(title: 'Hello Nikunj!', body: 'This is a zoned Scheduled Notification', payload: 'gaurav.msg');
            break;
        }
      },
      child: Text(text),
    );
  }
}

class GroupNotificationButton extends StatelessWidget {
  const GroupNotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Group Notification'),
    );
  }
}

PreferredSize gradAppBar() {
  return const PreferredSize(
    preferredSize: Size(double.infinity, 60),
    child: PhysicalModel(
      color: Colors.white,
      elevation: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.cyan, Colors.white24, Colors.yellowAccent], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              'Local notification',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
    ),
  );
}
