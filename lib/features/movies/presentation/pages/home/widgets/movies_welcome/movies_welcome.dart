import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_entity.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_welcome/swiper/movies_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A stateless widget that displays a welcome section with a horizontally scrollable
/// movie carousel after fetching data asynchronously.
///
/// This widget fetches movie data asynchronously using the provided [moviesAsync] parameter,
/// and displays a subset of the movie list (from index 0 to 6) inside a swipeable carousel using the
/// [MoviesSwiper] widget. It handles loading and error states using the `AsyncValue` states,
/// showing a loading indicator while the data is being fetched and rendering nothing on error.
///
/// Parameters:
/// - [moviesAsync]: An [AsyncValue] of type [MovieResponseEntity] containing the movie data
///   to be displayed. The widget reacts to the loading, data, and error states of this async data.
///
/// Returns:
/// - A [SizedBox] containing a movie swiper that is shown once the data is available,
///   or a loading indicator while the data is being fetched.
class MoviesWelcome extends StatelessWidget {
  final AsyncValue<MovieResponseEntity> moviesAsync;

  const MoviesWelcome({super.key, required this.moviesAsync});

  @override
  Widget build(_) {
    /// Returns a sublist of `movies` from the specified `start` index to the `end` index.
    ///
    /// If `end` exceeds the length of `movies`, the sublist will end at the last element.
    ///
    /// - Parameters:
    ///   - movies: The list of `MovieEntity` objects to extract the sublist from.
    ///   - start: The starting index for the sublist.
    ///   - end: The ending index for the sublist.
    ///
    /// - Returns: A sublist of `MovieEntity` objects from `start` to `end`.
    List<MovieEntity> getSublist(List<MovieEntity> movies, int start, int end) {
      return movies.sublist(start, movies.length > end ? end : movies.length);
    }

    return SizedBox(
      height: 210,
      child: moviesAsync.when(
        data:
            (movieResponse) => FadeIn(
              curve: Curves.easeInOut,
              child: MoviesSwiper(
                movies: getSublist(movieResponse.results, 0, 6),
              ),
            ),
        loading:
            () => FadeIn(
              curve: Curves.easeInOut,
              child: Center(child: const CircularProgressIndicator()),
            ),
        error: (error, stack) => SizedBox(),
      ),
    );
  }
}
