import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/core/router/router_name.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity_hive.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/local/get_movies.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

/// A screen that displays a grid of the user's favorite movies saved locally.
///
/// This screen loads data from local Hive storage and displays the movies
/// using a masonry-style grid layout.
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<DetailEntityHive> _movies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  /// Loads favorite movies from the local storage using the injected use case.
  ///
  /// Retrieves the use case via dependency injection and updates the state
  /// with the list of favorite movies.
  Future<void> _loadMovies() async {
    final getMoviesLocalUseCase = di<GetMoviesLocalUseCase>();
    final movies = await getMoviesLocalUseCase();
    setState(() {
      _movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_movies.isEmpty) {
      return Center(child: ZoomIn(child: Text('No favorites movies yet')));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        itemCount: _movies.length,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return ZoomIn(
            child: GestureDetector(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  height: 170,
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(color: Colors.black12);
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 170,
                      color: Colors.white10,
                      child: Center(
                        child: Icon(
                          Icons.photo_size_select_actual_rounded,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
              onTap:
                  () => context.pushNamed(
                    AppRouterName.movie,
                    pathParameters: {"id": movie.id.toString()},
                  ),
            ),
          );
        },
      ),
    );
  }
}
