import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notifications/Notifications/notifications.dart';
part 'home_page.dart';
part 'second_screen.dart';
part 'widgets.dart';

ValueNotifier<String> payload = ValueNotifier('');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize();
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('flutter_logo');
  //'flutter_logo' ->inside the android>app>src>main>res>drawable folder.

  const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  await notification.initialize(initializationSettings, onDidReceiveNotificationResponse: (details) async {
    payload.value = details.payload!;
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.cyan, secondaryHeaderColor: Colors.amber),
      title: 'local notifications',
      home: const HomePage(),
    );
  }
}
