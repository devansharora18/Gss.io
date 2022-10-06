import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:waste_management_app/logic/firestore.dart';

class Frame extends StatelessWidget {
  final snap;
  const Frame({super.key, required this.snap});

  delete(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Delete'),
            content: const Text('Delete this image'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () async {
                  FirestoreMethods().deleteImage(snap['imageId']);
                  Navigator.pop(context);
                },
                child: const Text('Yes', style: TextStyle(color: Colors.red)),
              ),
              CupertinoDialogAction(
                isDefaultAction: false,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 25),
      child: Column(children: [
        Container(
          //decoration: BoxDecoration(
          //  color: Colors.white,
          //  border: Border.all(
          //    color: Colors.red, // red as border color
          //  ),
          //),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0)
              .copyWith(right: 0),
          child: Row(
            children: [
              Text(snap['email']),
              const Spacer(),
              IconButton(
                  onPressed: () => delete(context), icon: Icon(Icons.delete))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          child: Image.network(
            snap['imageUrl'],
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(children: [
          Text(DateFormat.yMMMd().format(snap['time'].toDate())),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              List cords = snap['cords'];
              MapsLauncher.launchCoordinates(cords[0], cords[1]);
            },
            child: const Text('Open in maps'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
          ),
        ]),
      ]),
    );
  }
}
