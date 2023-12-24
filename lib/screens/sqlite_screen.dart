import 'package:flutter/material.dart';
import 'package:homework4/widgets/user_list_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteScreen extends StatefulWidget {
  @override
  _SQLiteScreenState createState() => _SQLiteScreenState();
}

class _SQLiteScreenState extends State<SQLiteScreen> {
  List<Map<String, dynamic>> userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserListWidget(userList),
            ElevatedButton(
              onPressed: () async {
                // Read data from SQLite database
                await _readDataFromSQLite();
              },
              child: Text('Read Data from SQLite'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _readDataFromSQLite() async {
    // Implement your logic to read data from SQLite
    // You can use the sqflite package for SQLite operations
    final database = openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT)',
        );
      },
      version: 1,
    );

    final Database db = await database;

    final List<Map<String, dynamic>> users = await db.query('users');

    setState(() {
      userList = users;
    });
  }
}
