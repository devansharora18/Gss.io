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
            title: const Center(child: Text('Waste Management'))),
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
          SizedBox(
            width: 170,
            child: Center(
              child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text('Sign up with Email'),
                    ],
                  )),
            ),
          ),
          const Spacer(),
          const Spacer(),
        ]),
      ),
    );
  }
}
