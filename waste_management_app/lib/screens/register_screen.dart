import 'package:flutter/material.dart';
import 'package:waste_management_app/widgets/text_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45.3),
        child: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(30, 30, 46, 0.7),
            title: const Center(child: Text('Register          '))),
      ),
      body: Column(
        children: [
          const Spacer(),
          const CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage('assets/man.jpg'),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 350,
              child: TextInput(
                  textEditingController: _email,
                  hintText: 'Enter your email',
                  textInputType: TextInputType.emailAddress),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: SizedBox(
              width: 350,
              child: TextInput(
                textEditingController: _password,
                hintText: 'Create a password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () {},
            child: const Text('Sign up'),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          //const Spacer(),
          //const Spacer(),
        ],
      ),
    );
  }
}
