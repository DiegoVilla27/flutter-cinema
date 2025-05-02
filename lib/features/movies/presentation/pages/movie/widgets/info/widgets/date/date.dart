import 'package:flutter/material.dart';
import 'package:flutter_cinema/shared/utils/dates/format.dart';

/// A widget that displays the movie status and release date in a formatted style.
///
/// The `MovieDate` widget displays a container with the movie's status (e.g., "Released" or "Upcoming")
/// and its release date, formatted according to the provided `releaseDate` parameter. The status and
/// release date are displayed within a stylized container with rounded edges and padding. The date is
/// formatted using the `formatDateWithPattern` function.
///
/// Parameters:
/// - [status]: The current status of the movie (e.g., "Released", "Coming Soon").
/// - [releaseDate]: The release date of the movie, represented as a `DateTime` object.
///
/// Returns:
/// - A styled container containing the status and formatted release date as text.
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
        '$status - ${formatDateWithPattern(releaseDate, 'd MMMM y')}',
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
