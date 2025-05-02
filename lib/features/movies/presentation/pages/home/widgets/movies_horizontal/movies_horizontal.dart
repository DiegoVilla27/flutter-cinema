import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_horizontal/widgets/widgets.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/base/base_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A stateless widget that displays a horizontally scrollable list of movie cards
/// with an optional title and date range, using an asynchronous data source.
///
/// This widget is typically used to showcase a section of movies (e.g., "Now Playing")
/// with a horizontal scroll view. It takes in the movie data wrapped in an [AsyncValue]
/// and a [provider] for state management, showing the movie cards and a title if available.
/// The title is displayed at the top of the section, and the date range is displayed if the data
/// includes a valid `dates` object.
///
/// Parameters:
/// - [title]: The section title to display (e.g., "Now Playing").
/// - [moviesAsync]: An [AsyncValue] containing the movie data, which can be in a loading, success, or error state.
/// - [provider]: An [AsyncNotifierProvider] for managing and fetching movie data.
///
/// Returns:
/// - A [Padding] widget containing a [FadeIn] animation and a [Column] that holds the
///   movie title and a list of horizontally scrollable movie cards.
class MoviesHorizontal<T extends MoviesNotifierBase> extends StatelessWidget {
  final String title;
  final AsyncValue<MovieResponseEntity> moviesAsync;
  final AsyncNotifierProvider<T, MovieResponseEntity> provider;

  const MoviesHorizontal({
    super.key,
    required this.moviesAsync,
    required this.title,
    required this.provider,
  });

  @override
  Widget build(_) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FadeIn(
        curve: Curves.easeInOut,
        child: Column(
          spacing: 10.0,
          children: [
            if (!moviesAsync.isLoading)
              MoviesHorizontalTitle(
                title: title,
                dates:
                    moviesAsync.value?.dates != null
                        ? moviesAsync.value!.dates
                        : null,
              ),
            MoviesHorizontalCards(moviesAsync: moviesAsync, provider: provider),
          ],
        ),
      ),
    );
  }
}
