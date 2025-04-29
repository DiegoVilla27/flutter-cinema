import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/movie/widgets/appbar/appbar.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/movie/widgets/info/info.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movie_detail/get_movie_detail_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  final int id;

  const MovieScreen({super.key, required this.id});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(movieDetailNotifierProvider.notifier).loadDetails(widget.id);
      }
    });
  }

  @override
  Widget build(_) {
    final detailAsync = ref.watch(movieDetailNotifierProvider);

    return detailAsync.when(
      data: (movie) {
        return FadeIn(
          child: CustomScrollView(
            slivers: [
              MovieAppBar(title: movie.title, posterPath: movie.posterPath),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return MovieInfo(movie: movie);
                }, childCount: 1),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) {
        return SizedBox();
      },
    );
  }
}
