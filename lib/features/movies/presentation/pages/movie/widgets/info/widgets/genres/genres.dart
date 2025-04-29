import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';

class MovieGenres extends StatelessWidget {
  final List<GenreEntity> genres;

  const MovieGenres({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children:
          genres
              .map(
                (genre) => Chip(
                  label: Text(genre.name),
                  padding: EdgeInsets.zero,
                  labelStyle: TextStyle(fontSize: 12),
                ),
              )
              .toList(),
    );
  }
}
