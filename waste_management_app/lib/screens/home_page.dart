import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:waste_management_app/screens/login_screen.dart';
import 'package:waste_management_app/screens/register_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45.3),
        child: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: const Color.fromRGBO(30, 30, 46, 0.7),
            title: const Text('Waste Management')),
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          const CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage('assets/man.jpg'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              );
            },
            child: const Text('Sign up with Email'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Login if already registered'),
          ),
          const Spacer(),
          const Spacer(),
        ]),
      ),
    );
  }
}
