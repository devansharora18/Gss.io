import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  const Frame({super.key});

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
              Text('Email Address'),
              const Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          child: Image.network(
            'https://images.unsplash.com/photo-1664747477807-566fbc875bdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80',
            fit: BoxFit.cover,
          ),
        )
      ]),
    );
  }
}
