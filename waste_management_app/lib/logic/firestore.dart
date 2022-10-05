import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:waste_management_app/logic/storage.dart';
import 'package:waste_management_app/models/image.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadImage(
    List cords,
    Uint8List file,
    String uid,
    String email,
  ) async {
    String res = 'Some error occured';

    try {
      String imageUrl = await Storage().uploadImage('images', file);

      ImageModel image = ImageModel(
          email: email,
          uid: uid,
          cords: cords,
          imageId: '',
          imageUrl: imageUrl);
    } catch (e) {}
  }
}
