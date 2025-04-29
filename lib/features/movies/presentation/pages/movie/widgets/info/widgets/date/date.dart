import 'package:flutter/material.dart';
import 'package:flutter_cinema/shared/utils/dates/format.dart';

class MovieDate extends StatelessWidget {
  final String status;
  final DateTime releaseDate;

  const MovieDate({super.key, required this.status, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Text(
        '$status - ${formatDateWithPattern(releaseDate, 'EEE, MMM d')}',
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
