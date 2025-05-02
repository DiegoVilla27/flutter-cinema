import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_entity.dart';

/// A stateless widget that displays a movie backdrop image with a fade-in animation,
/// and handles loading and error states for the image.
///
/// This widget is typically used to display a movie's backdrop in a swipeable or 
/// card-like layout. The movie image is fetched from a network URL, and during the loading state, 
/// a placeholder container is shown. If an error occurs while loading the image, 
/// a fallback error icon is displayed.
///
/// Parameters:
/// - [movie]: A [MovieEntity] that contains the movie details, including the backdrop image URL.
///
/// Returns:
/// - A [FadeIn] widget that wraps the movie backdrop image inside a [ClipRRect] with rounded corners, 
///   displaying the image with a loading placeholder and an error icon if needed.
class MovieSwipe extends StatelessWidget {
  final MovieEntity movie;

  const MovieSwipe({super.key, required this.movie});

  @override
  Widget build(_) {
    return FadeIn(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: double.infinity,
                height: 180,
                color: Colors.black12,
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: double.infinity,
                color: Colors.white10,
                child: Center(
                  child: Icon(Icons.photo_size_select_actual_rounded, size: 40),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
