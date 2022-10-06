import 'package:flutter/material.dart';
import 'package:waste_management_app/widgets/frame.dart';

class AdminUI extends StatelessWidget {
  const AdminUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45.3),
        child: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: const Color.fromRGBO(30, 30, 46, 0.7),
            title: const Text('Administrator')),
      ),
      body: Frame(),
    );
  }
}
