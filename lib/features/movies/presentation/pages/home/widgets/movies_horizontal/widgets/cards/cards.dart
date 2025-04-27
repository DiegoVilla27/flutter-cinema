import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_horizontal/widgets/cards/widgets/card/card.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/base/base_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
