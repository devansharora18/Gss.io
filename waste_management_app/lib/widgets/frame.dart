import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Frame extends StatelessWidget {
  final snap;
  const Frame({super.key, required this.snap});

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
              IconButton(onPressed: () {}, icon: Icon(Icons.delete))
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
        Center(
          child: ElevatedButton(
            onPressed: () {
              List cords = snap['cords'];
              MapsLauncher.launchCoordinates(cords[0], cords[1]);
            },
            child: const Text('Open in maps'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
          ),
        ),
      ]),
    );
  }
}
