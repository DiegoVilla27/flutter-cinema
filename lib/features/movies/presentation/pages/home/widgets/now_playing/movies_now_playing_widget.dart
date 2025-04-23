import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/now_playing/swiper/movies_swiper_widget.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies/get_movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesNowPlaying extends ConsumerWidget {
  const MoviesNowPlaying({super.key});

  @override
  Widget build(_, WidgetRef ref) {
    final moviesAsync = ref.watch(moviesNotifierProvider);
    // final moviesNotifier = ref.read(moviesNotifierProvider.notifier);

    return SizedBox(
      height: 210,
      child: moviesAsync.when(
        data: (movieResponse) => MoviesSwiper(movies: movieResponse.results),
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
