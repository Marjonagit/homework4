import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String errorMessage;

  ErrorMessageWidget(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage, style: TextStyle(color: Colors.red));
  }
}
