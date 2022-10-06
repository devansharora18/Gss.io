import 'package:cloud_firestore/cloud_firestore.dart';

class ImageModel {
  final String email;
  final String uid;
  final List cords;
  final String imageId;
  final String imageUrl;
  final time;

  const ImageModel(
      {required this.email,
      required this.uid,
      required this.cords,
      required this.imageId,
      required this.imageUrl,
      required this.time});

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'cords': cords,
        'imageId': imageId,
        'imageUrl': imageUrl,
        'time': time,
      };

  static ImageModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ImageModel(
        uid: snapshot['uid'],
        email: snapshot['email'],
        cords: snapshot['cords'],
        imageId: snapshot['imageId'],
        imageUrl: snapshot['imageUrl'],
        time: snapshot['time']);
  }
}
