import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 4.0,
        top: 4.0,
        bottom: 4.0,
      ),
      child: Row(
        children: [
          Icon(Icons.movie, color: Colors.deepPurpleAccent),
          SizedBox(width: 10.0),
          Text(
            "Cinema",
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
    );
  }
}
