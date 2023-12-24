import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Function onPressed;

  ButtonWidget({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(label),
    );
  }
}
