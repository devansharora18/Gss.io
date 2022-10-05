import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:waste_management_app/logic/storage.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadImage(
    List cords,
    Uint8List file,
  ) async {
    String res = 'Some error occured';

    try {
      String photoUrl = await Storage().uploadImage('images', file);
    } catch (e) {}
  }
}
