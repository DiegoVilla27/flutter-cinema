import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/movie/widgets/info/widgets/actors/actors.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/movie/widgets/info/widgets/date/date.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/movie/widgets/info/widgets/genres/genres.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movie_actors/get_movie_actors_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieInfo extends ConsumerStatefulWidget {
  final DetailEntity movie;

  const MovieInfo({super.key, required this.movie});

  @override
  ConsumerState<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends ConsumerState<MovieInfo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref
            .read(movieActorsNotifierProvider.notifier)
            .loadActors(widget.movie.id);
      }
    });
  }

  @override
  Widget build(_) {
    final actorsAsync = ref.watch(movieActorsNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieDate(
            status: widget.movie.status,
            releaseDate: widget.movie.releaseDate,
          ),
          SizedBox(height: 10),
          MovieGenres(genres: widget.movie.genres),
          SizedBox(height: 10),
          Text(widget.movie.overview),
          SizedBox(height: 20),
          MovieActors(actorsAsync: actorsAsync),
        ],
      ),
    );
  }
}
