import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/router/router_name.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_entity.dart';
import 'package:flutter_cinema/shared/utils/numbers/format.dart';
import 'package:flutter_cinema/shared/utils/stars/color_star.dart';
import 'package:flutter_cinema/shared/utils/stars/icon_star.dart';
import 'package:go_router/go_router.dart';

/// A reusable widget that displays a movie card in a horizontal layout,
/// including poster image, title, overview and rating.
///
/// Typically used in horizontal carousels or search result lists.
class MovieDelegate extends StatelessWidget {
  final MovieEntity movie;

  const MovieDelegate({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      height: 200,
      child: GestureDetector(
        child: Row(
          spacing: 15.0,
          children: [_imageContainer(), _infoContainer()],
        ),
        onTap:
            () => context.pushNamed(
              AppRouterName.movie,
              pathParameters: {"id": movie.id.toString()},
            ),
      ),
    );
  }

  /// Builds the poster image with rounded corners, loading and error placeholders.
  ///
  /// @returns A [ClipRRect] widget containing the poster image.
  ClipRRect _imageContainer() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        movie.posterPath,
        fit: BoxFit.cover,
        width: 120,
        height: 185,
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(width: 120, height: 185, color: Colors.black12);
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 120,
            height: 185,
            color: Colors.white10,
            child: Center(
              child: Icon(Icons.photo_size_select_actual_rounded, size: 40),
            ),
          );
        },
      ),
    );
  }

  /// Builds the information section containing title, overview and rating.
  ///
  /// @returns An [Expanded] widget that takes available space next to the poster.
  Expanded _infoContainer() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.0,
              children: [
                Text(
                  movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  movie.overview,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
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
      ),
    );
  }
}
