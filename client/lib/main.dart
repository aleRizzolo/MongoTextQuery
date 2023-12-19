import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/get_screen.dart';
import 'package:client/screens/add_screen.dart';
import 'package:client/screens/delete_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var logger = Logger();

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AddScreen(),
        '/delete': (context) => const DeleteScreen(),
        '/get': (context) => const GetScreen()
      },
    );
  }
}
