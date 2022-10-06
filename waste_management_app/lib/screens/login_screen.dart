import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:waste_management_app/logic/auth.dart';
import 'package:waste_management_app/logic/snack_bar.dart';
import 'package:waste_management_app/screens/selector_page.dart';
import 'package:waste_management_app/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res =
        await AuthMethods().logIn(email: _email.text, password: _password.text);
    setState(() {
      _isLoading = false;
    });
    if (res == 'success') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SelectorPage()),
      );
    } else {
      showSnackBar(res, context, Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45.3),
        child: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(30, 30, 46, 0.7),
            title: const Center(child: Text('Login screen       '))),
      ),
      body: Column(
        children: [
          const Spacer(),
          const CircleAvatar(
            radius: 120,
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
                hintText: 'Enter your password',
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
            onPressed: () => loginUser(),
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Text('Login'),
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
