import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_management_app/logic/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String email = '';
  Uint8List? _file;
  var locationMsg = "";

  void getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lastPosition = await Geolocator.getLastKnownPosition();

    print(lastPosition);
    setState(() {
      locationMsg = '${position.latitude}, ${position.longitude}';
    });
  }

  void proceed() {
    getCurrentLocation();
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  void getEmail() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      email = (snap.data() as Map<String, dynamic>)['email'];
    });
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Complaint'),
            content: const Text('Select photo to upload'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await imagePicker(
                    ImageSource.camera,
                  );
                  setState(() {
                    _file = file;
                  });
                },
                child: const Text('Take a photo'),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await imagePicker(
                    ImageSource.gallery,
                  );
                  setState(() {
                    _file = file;
                  });
                },
                child: const Text('Choose from gallary'),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45.3),
        child: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(30, 30, 46, 0.7),
            title: const Center(child: Text('Waste Management     '))),
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text('Hey $email'),
        ),
        const Spacer(),
        _file == null
            ? Center(
                child: IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: () => _selectImage(context),
                ),
              )
            : Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: AspectRatio(
                        aspectRatio: 480 / 400,
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: MemoryImage(_file!),
                                    fit: BoxFit.fill,
                                    alignment: FractionalOffset.topCenter))),
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
                      onPressed: () =>
                          locationMsg == "" ? getCurrentLocation() : proceed(),
                      child: locationMsg == ""
                          ? const Text('Grant Location')
                          : const Text('Proceed')),
                ],
              ),
        const Spacer(),
      ]),
    );
  }
}
