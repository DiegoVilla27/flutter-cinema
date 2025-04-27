import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_horizontal/widgets/widgets.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/base/base_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
