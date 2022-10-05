import 'package:flutter/material.dart';
import 'package:waste_management_app/screens/user_screen.dart';

class SelectorPage extends StatelessWidget {
  const SelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45.3),
        child: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(30, 30, 46, 0.7),
            title: const Center(child: Text('Login screen'))),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserScreen()),
                );
              },
              child: const Text('Login as user')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {},
              child: const Text('Login as admin')),
          const Spacer(),
          const Spacer(),
          //const Spacer(),
          //const Spacer(),
        ]),
      ),
    );
  }
}
