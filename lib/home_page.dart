part of 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gradAppBar(),
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.cyan, Colors.white24, Colors.yellowAccent], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const NotificationButton(text: 'Simple Notification', type: NotificationType.simple),
              const NotificationButton(text: 'Big Notification', type: NotificationType.big),
              const NotificationButton(text: 'Group Notification', type: NotificationType.group),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  NotificationButton(text: 'Schedule Notification', type: NotificationType.schedule),
                  NotificationButton(text: 'Cancel Notification', type: NotificationType.cancel),
                ],
              ),
              const NotificationButton(text: 'Zoned Notification', type: NotificationType.zoned)
            ],
          ),
        ),
      ),
    );
  }
}
