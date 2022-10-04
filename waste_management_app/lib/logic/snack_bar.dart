import 'package:flutter/material.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 110, right: 20, left: 20),
    content: Text(
      content,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  ));
}
