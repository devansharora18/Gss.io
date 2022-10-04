import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> register({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        _firestore.collection('users').doc(user.user!.uid).set({
          'email': email,
          'uid': user.user!.uid,
        });
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
