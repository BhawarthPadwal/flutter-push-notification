import 'package:flutter/material.dart';
import 'package:flutter_push_notification/screens/home_screen.dart';
import 'package:flutter_push_notification/screens/notification_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/notification': (context) => NotificationScreen(),
      },
      navigatorKey: navigatorKey,
    );
  }
}

// 400706
