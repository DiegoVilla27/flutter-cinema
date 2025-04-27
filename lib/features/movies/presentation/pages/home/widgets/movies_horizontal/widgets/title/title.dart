import 'package:flutter/material.dart';

class MoviesHorizontalTitle extends StatelessWidget {
  final String title;
  final String date;

  const MoviesHorizontalTitle({super.key, required this.title, required this.date});

  @override
  Widget build(_) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Text(
            date,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
