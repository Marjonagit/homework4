import 'package:flutter/material.dart';
import 'package:homework4/screens/welcome_screen.dart';
import 'package:homework4/screens/user_info_screen.dart';
import 'package:homework4/screens/sqlite_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WelcomeScreen(), // Use home instead of initialRoute
      routes: {
        '/user_info': (context) => UserInfoScreen(),
        '/sqlite_screen': (context) => SQLiteScreen(),
      },
    );
  }
}
