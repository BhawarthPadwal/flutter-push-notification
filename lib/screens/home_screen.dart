import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_push_notification/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String BASE_URL = dotenv.env['BASE_URL']!;
  final String TOKEN = dotenv.env['TOKEN']!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ApiService.post(BASE_URL, {
              "token": TOKEN,
              "title": "Hello from Node.js",
              "body": "This is a test notification",
            });
          },
          child: Text('Send Notification'),
        ),
      ),
    );
  }
}
