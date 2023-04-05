import 'package:flutter/material.dart';
import 'package:local_notifications/Notifications/notifications.dart';
part 'home_page.dart';
part 'widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();

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
