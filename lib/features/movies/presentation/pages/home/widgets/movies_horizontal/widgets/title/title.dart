import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';
import 'package:flutter_cinema/shared/utils/dates/format.dart';

class MoviesHorizontalTitle extends StatelessWidget {
  final String title;
  final DatesResponseEntity? dates;

  const MoviesHorizontalTitle({super.key, required this.title, this.dates});

  String _buildDate() {
    DateTime dateMin = dates?.minimum ?? DateTime.now();
    DateTime dateMax = dates?.maximum ?? DateTime.now();

    return "${formatDateWithPattern(dateMin, 'MMM d')} - ${formatDateWithPattern(dateMax, 'MMM d')}";
  }

  @override
  Widget build(_) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        if (dates != null)
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 10.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Text(
              _buildDate(),
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
