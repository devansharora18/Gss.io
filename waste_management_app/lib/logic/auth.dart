import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> register({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
