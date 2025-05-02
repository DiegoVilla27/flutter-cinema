import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';

/// A widget that displays a list of movie genres as chips.
///
/// The `MovieGenres` widget takes a list of `GenreEntity` objects and displays each genre as a `Chip` widget.
/// Each chip represents a movie genre, with the genre's name displayed as the label. The genres are displayed
/// in a horizontal wrap layout, with customizable spacing between the chips.
///
/// Parameters:
/// - [genres]: A list of `GenreEntity` objects representing the movie genres to be displayed.
///
/// Returns:
/// - A `Wrap` widget containing a list of `Chip` widgets, each displaying a movie genre's name.
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
