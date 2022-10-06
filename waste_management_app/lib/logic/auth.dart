import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:waste_management_app/models/user.dart' as model;

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

        print(user.user!.uid);

        model.User user_model = model.User(
          uid: user.user!.uid,
          email: email,
        );

        await _firestore
            .collection('users')
            .doc(user.user!.uid)
            .set(user_model.toJson());
        res = 'success';
      }
    } on FirebaseAuthException catch (e) {
      res = e.toString();
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> logIn({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Pls enter all the fields";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
