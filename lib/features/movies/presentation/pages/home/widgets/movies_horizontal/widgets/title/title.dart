import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_response_entity.dart';
import 'package:flutter_cinema/shared/utils/dates/format.dart';

/// A stateless widget that displays a section title for a horizontal list of movies,
/// optionally including a formatted date range badge.
///
/// This widget is typically used as a header above horizontally scrollable movie sections.
/// It shows the provided [title] on the left and, if available, a date range on the right,
/// derived from the [dates] object. The date range is formatted as `"MMM d - MMM d"`
/// (e.g., "Apr 1 - Apr 30") and rendered inside a styled capsule.
///
/// Parameters:
/// - [title]: The section title to display (e.g., "Now Playing").
/// - [dates]: Optional [DatesResponseEntity] containing a `minimum` and `maximum` date
///   to display a range next to the title.
///
/// Returns:
/// - A [Row] widget with the title and an optional date badge.
class MoviesHorizontalTitle extends StatelessWidget {
  final String title;
  final DatesResponseEntity? dates;

  const MoviesHorizontalTitle({super.key, required this.title, this.dates});

  /// Builds and returns a formatted date range string from [dates].
  ///
  /// Uses the [minimum] and [maximum] values from the [dates] object to create
  /// a range in the format: `"MMM d - MMM d"` (e.g., "Apr 1 - Apr 30").
  /// If [dates] is null, it falls back to [DateTime.now()] for both values.
  ///
  /// Returns:
  /// - A [String] representing the formatted date range.
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
