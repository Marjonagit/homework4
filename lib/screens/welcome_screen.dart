import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:homework4/screens/user_info_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    // Use Future.delayed to allow the widget to finish building
    Future.delayed(Duration.zero, () {
      _checkFirstLaunch();
    });
  }

  _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('firstLaunch') ?? true;

    if (isFirstLaunch) {
      // Show the tutorial or any welcome content
      // For simplicity, let's just show a dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Welcome!"),
            content: Text("This is a quick tutorial."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Got it"),
              ),
            ],
          );
        },
      );

      // Mark first launch as false
      prefs.setBool('firstLaunch', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserInfoScreen(),
              ),
            );
          },
          child: Text('Proceed to User Info'),
        ),
      ),
    );
  }
}
