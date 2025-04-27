import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/widgets/movies_horizontal/widgets/widgets.dart';
import 'package:flutter_cinema/shared/utils/dates/format.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesHorizontal extends StatelessWidget {
  final String title;
  final AsyncValue<MovieResponseEntity> moviesAsync;

  const MoviesHorizontal({
    super.key,
    required this.moviesAsync,
    required this.title,
  });

  String _buildDate() {
    DateTime dateMin = moviesAsync.value?.dates.minimum ?? DateTime.now();
    DateTime dateMax = moviesAsync.value?.dates.maximum ?? DateTime.now();

    return "${formatDateWithPattern(dateMin, 'E d')} - ${formatDateWithPattern(dateMax, 'E d')}";
  }

  @override
  Widget build(_) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FadeIn(
        curve: Curves.easeInOut,
        child: Column(
          spacing: 10.0,
          children: [
            if (!moviesAsync.isLoading) MoviesHorizontalTitle(title: title, date: _buildDate()),
            MoviesHorizontalCards(moviesAsync: moviesAsync),
          ],
        ),
      ),
    );
  }
}
