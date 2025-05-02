import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/router/router_name.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_entity.dart';
import 'package:flutter_cinema/shared/utils/numbers/format.dart';
import 'package:go_router/go_router.dart';

/// A stateless widget that displays a compact horizontal movie card with poster, title, and rating.
///
/// This widget is designed for use in horizontally scrollable movie lists. It shows
/// the movie's poster image, a tooltip with its title, and a visual rating indicator 
/// (star icon + formatted score).
///
/// The star icon and its color are dynamically determined based on the movie's 
/// `voteAverage`, offering quick visual feedback about the movie's rating:
/// - Less than 5: outlined star with light color (poor rating)
/// - Between 5 and 7: half star with amber color (average rating)
/// - 7 or greater: full star with deep purple accent (high rating)
///
/// When the user taps on the poster, it navigates to the movie details page using
/// named routing with the movie ID.
///
/// Parameters:
/// - [movie]: A [MovieEntity] containing the data to be displayed.
///
/// Returns:
/// - A [Container] widget representing a horizontal card with movie information.
class MovieHorizontalCard extends StatelessWidget {
  final MovieEntity movie;

  const MovieHorizontalCard({super.key, required this.movie});

  /// Returns a star icon that visually represents the movie's average vote score.
  ///
  /// The icon varies depending on the `voteAverage`:
  /// - Less than 5: an outlined star (`Icons.star_outline_rounded`)
  /// - Between 5 (inclusive) and 7 (exclusive): a half star (`Icons.star_half_rounded`)
  /// - 7 or greater: a full star (`Icons.star_rounded`)
  ///
  /// Returns:
  /// - [IconData] representing the appropriate star icon based on the rating.
  IconData _iconStar() {
    if (movie.voteAverage < 5) {
      return Icons.star_outline_rounded;
    } else if (movie.voteAverage < 7) {
      return Icons.star_half_rounded;
    } else {
      return Icons.star_rounded;
    }
  }

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
  Color _colorStar() {
    if (movie.voteAverage < 5) {
      return Colors.white54;
    } else if (movie.voteAverage < 7) {
      return Colors.amber;
    } else {
      return Colors.deepPurpleAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.0,
        children: [
          GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                height: 185,
                loadingBuilder: (_, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: double.infinity,
                    height: 185,
                    color: Colors.black12,
                  );
                },
              ),
            ),
            onTap:
                () => context.pushNamed(
                  AppRouterName.movie,
                  pathParameters: {"id": movie.id.toString()},
                ),
          ),
          Tooltip(
            message: movie.title,
            child: Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
          Row(
            children: [
              Icon(_iconStar(), color: _colorStar(), size: 20),
              SizedBox(width: 4),
              Text(
                formatCurrency(movie.voteAverage, decimalDigits: 1),
                style: TextStyle(color: _colorStar(), fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
