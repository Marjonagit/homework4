import 'package:flutter/material.dart';
import 'package:homework4/screens/sqlite_screen.dart';
import 'package:homework4/widgets/button_widget.dart';
import 'package:homework4/widgets/user_list_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  List<Map<String, dynamic>> userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserListWidget(userList),
            ButtonWidget(
              label: 'Get More Users',
              onPressed: () async {
                // Fetch more users from the random user API
                await _fetchMoreUsers();
              },
            ),
            ButtonWidget(
              label: 'Store Data to SQLite',
              onPressed: () async {
                // Store selected data into local SQLite database
                await _storeDataToSQLite();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchMoreUsers() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=5'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      setState(() {
        userList
            .addAll(results.cast<Map<String, dynamic>>()); // Fix type mismatch
      });
    } else {
      // Handle error
      print('Failed to load users');
    }
  }

  Future<void> _storeDataToSQLite() async {
    // Implement your logic to store data into SQLite
    // For simplicity, let's assume userList contains data to be stored
    // You can use the sqflite package for SQLite operations
    print('Storing data to SQLite: $userList');
  }
}
