import 'package:flutter/material.dart';

/// Returns a star icon that visually represents the movie's average vote score.
///
/// The icon varies depending on the `voteAverage`:
/// - Less than 5: an outlined star (`Icons.star_outline_rounded`)
/// - Between 5 (inclusive) and 7 (exclusive): a half star (`Icons.star_half_rounded`)
/// - 7 or greater: a full star (`Icons.star_rounded`)
///
/// Returns:
/// - [IconData] representing the appropriate star icon based on the rating.
IconData iconStar(double voteAverage) {
  if (voteAverage < 5) {
    return Icons.star_outline_rounded;
  } else if (voteAverage < 7) {
    return Icons.star_half_rounded;
  } else {
    return Icons.star_rounded;
  }
}
