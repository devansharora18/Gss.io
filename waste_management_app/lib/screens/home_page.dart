import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45.3),
        child: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(30, 30, 46, 0.7),
            title: const Center(child: Text('Home Page'))),
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          const Text('Sign in with Google'),
          ElevatedButton(
              onPressed: () {}, child: const Text('Sign in with Google')),
          const Spacer(),
        ]),
      ),
    );
  }
}
