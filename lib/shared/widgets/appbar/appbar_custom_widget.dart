import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(_) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 4.0,
          top: 4.0,
          bottom: 4.0,
        ),
        child: Row(
          children: [
            Icon(Icons.movie, color: Colors.deepPurpleAccent),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Cinema",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
