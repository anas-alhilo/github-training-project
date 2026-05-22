import 'package:flutter/material.dart';

extension ContextHelper on BuildContext {
  void showSnackBar({required String title, bool error = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        backgroundColor: error ? Colors.red.shade700 : Colors.blue.shade300,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }
}
