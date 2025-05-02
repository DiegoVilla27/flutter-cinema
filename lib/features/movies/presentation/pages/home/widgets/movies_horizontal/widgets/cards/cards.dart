import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_horizontal/widgets/cards/widgets/card/card.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/base/base_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A horizontally scrollable list of movie cards that supports infinite pagination.
///
/// This widget uses a [ScrollController] to listen for scroll events and
/// automatically triggers the loading of the next page of movies via a
/// [MoviesNotifierBase] when the user nears the end of the list.
///
/// It uses Riverpod's [ConsumerStatefulWidget] to reactively consume state from
/// an [AsyncNotifierProvider]. The widget displays a loading spinner while fetching,
/// and uses animated transitions when rendering movie cards.
///
/// Type Parameters:
/// - `T`: A type that extends [MoviesNotifierBase], responsible for managing
///   and paginating the movie data.
///
/// Parameters:
/// - [moviesAsync]: The current state of the movie data to display.
/// - [provider]: The provider that exposes the notifier to request the next page.
///
/// Returns:
/// - A horizontally scrollable [ListView] of movie cards, or a loader/error widget
///   depending on the state of [moviesAsync].
class MoviesHorizontalCards<T extends MoviesNotifierBase>
    extends ConsumerStatefulWidget {
  final AsyncValue<MovieResponseEntity> moviesAsync;
  final AsyncNotifierProvider<T, MovieResponseEntity> provider;

  const MoviesHorizontalCards({
    super.key,
    required this.moviesAsync,
    required this.provider,
  });

  @override
  ConsumerState<MoviesHorizontalCards<T>> createState() =>
      _MoviesHorizontalCardsState<T>();
}

class _MoviesHorizontalCardsState<T extends MoviesNotifierBase>
    extends ConsumerState<MoviesHorizontalCards<T>> {
  final ScrollController _controller = ScrollController();
  bool _isLoadingMore = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _watchScrollAndLoadMoreMovies();
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  /// Sets up a scroll listener that triggers the loading of the next page
  /// of movies when the user scrolls near the bottom of the list.
  ///
  /// This function adds a listener to the [_controller] that checks if the user
  /// has scrolled within 100 pixels of the bottom of the scrollable area. If so,
  /// and no other loading is in progress (`_isLoadingMore`), it calls the
  /// `nextPage()` method from the provided [StateNotifier].
  ///
  /// A debounce delay of 500 milliseconds is used to prevent rapid repeated triggers.
  _watchScrollAndLoadMoreMovies() {
    _controller.addListener(() async {
      if ((_controller.position.pixels >=
              _controller.position.maxScrollExtent - 100) &&
          !_isLoadingMore) {
        _isLoadingMore = true;
        try {
          await ref.read(widget.provider.notifier).nextPage();
        } finally {
          _debounce = Timer(
            const Duration(milliseconds: 500),
            () => _isLoadingMore = false,
          );
        }
      }
    });
  }

  @override
  Widget build(_) {
    return SizedBox(
      height: 245,
      child: widget.moviesAsync.when(
        data:
            (movieResponse) => ListView.builder(
              controller: _controller,
              itemExtent: 140,
              scrollDirection: Axis.horizontal,
              itemCount: movieResponse.results.length,
              itemBuilder:
                  (_, index) => ZoomIn(
                    curve: Curves.easeInOut,
                    child: MovieHorizontalCard(
                      movie: movieResponse.results[index],
                    ),
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
