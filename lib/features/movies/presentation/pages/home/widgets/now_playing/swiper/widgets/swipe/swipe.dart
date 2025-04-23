import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_entity.dart';

class MovieSwipe extends StatelessWidget {
  final MovieEntity movie;

  const MovieSwipe({super.key, required this.movie});

  @override
  Widget build(_) {
    return FadeIn(
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
          ),
        ),
      ),
    );
  }
}
