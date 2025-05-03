import 'package:flutter/material.dart';

/// Returns a color that visually represents the movie's average vote score,
/// intended to match the star icon's visual style.
///
/// The color varies depending on the `voteAverage`:
/// - Less than 5: [Colors.white54] (low rating)
/// - Between 5 (inclusive) and 7 (exclusive): [Colors.amber] (average rating)
/// - 7 or greater: [Colors.deepPurpleAccent] (high rating)
///
/// Returns:
/// - [Color] indicating the rating level through visual color feedback.
Color colorStar(double voteAverage) {
  if (voteAverage < 5) {
    return Colors.white54;
  } else if (voteAverage < 7) {
    return Colors.amber;
  } else {
    return Colors.deepPurpleAccent;
  }
}
