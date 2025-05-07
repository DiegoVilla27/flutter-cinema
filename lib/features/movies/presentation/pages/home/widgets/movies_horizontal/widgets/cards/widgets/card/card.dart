import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/router/router_name.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_entity.dart';
import 'package:flutter_cinema/shared/utils/numbers/format.dart';
import 'package:flutter_cinema/shared/utils/stars/color_star.dart';
import 'package:flutter_cinema/shared/utils/stars/icon_star.dart';
import 'package:go_router/go_router.dart';

/// A stateless widget that displays a compact horizontal movie card with poster, title, and rating.
///
/// This widget is designed for use in horizontally scrollable movie lists. It shows
/// the movie's poster image, a tooltip with its title, and a visual rating indicator
/// (star icon + formatted score).
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
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 185,
                    color: Colors.white10,
                    child: Center(
                      child: Icon(
                        Icons.photo_size_select_actual_rounded,
                        size: 40,
                      ),
                    ),
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
              Icon(
                iconStar(movie.voteAverage),
                color: colorStar(movie.voteAverage),
                size: 20,
              ),
              SizedBox(width: 4),
              Text(
                formatCurrency(movie.voteAverage, decimalDigits: 1),
                style: TextStyle(
                  color: colorStar(movie.voteAverage),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
