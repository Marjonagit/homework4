import 'package:flutter/material.dart';

class UserListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> userList;

  UserListWidget(this.userList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(userList[index]['name']['first']),
            subtitle: Text(userList[index]['email']),
          );
        },
      ),
    );
  }
}
