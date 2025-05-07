import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity_hive.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/local/delete_movie.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/local/get_movie.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/local/save_movie.dart';
import 'package:flutter_cinema/shared/widgets/snackbar/snackbar_custom_widget.dart';

/// A button that allows the user to add or remove a movie from their favorites.
///
/// It uses local storage (Hive) to persist the favorite state.
class MovieFavoriteBtn extends StatefulWidget {
  final DetailEntity movie;

  const MovieFavoriteBtn({super.key, required this.movie});

  @override
  State<MovieFavoriteBtn> createState() => _MovieFavoriteBtnState();
}

class _MovieFavoriteBtnState extends State<MovieFavoriteBtn> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadMovieLocal();
  }

  /// Loads the favorite state of the movie from local storage (Hive).
  ///
  /// Sets [_isFavorite] to `true` if the movie is found in local storage, otherwise `false`.
  void _loadMovieLocal() async {
    GetMovieLocalUseCase getMovieLocalUseCase = di<GetMovieLocalUseCase>();
    DetailEntityHive? movieById = await getMovieLocalUseCase(widget.movie.id);
    setState(() => _isFavorite = (movieById != null) ? true : false);
  }

  /// Toggles the favorite state of the given [movie].
  ///
  /// - If the movie is marked as favorite, it saves it to Hive.
  /// - Otherwise, it removes it from Hive.
  ///
  /// Also shows a snackbar indicating whether the movie was added or removed.
  ///
  /// Params:
  /// - [movie]: The [DetailEntity] to toggle favorite state for.
  void _toggleFavorite(DetailEntity movie) async {
    setState(() => _isFavorite = !_isFavorite);

    if (_isFavorite) {
      SaveMovieLocalUseCase saveMovieLocalUseCase = di<SaveMovieLocalUseCase>();
      DetailEntityHive detailEntityHive = DetailEntityHive(
        id: movie.id,
        posterPath: movie.posterPath,
      );
      await saveMovieLocalUseCase(detailEntityHive);
    } else {
      DeleteMovieLocalUseCase deleteMovieLocalUseCase =
          di<DeleteMovieLocalUseCase>();
      await deleteMovieLocalUseCase(movie.id);
    }

    SnackBarCustom.open(
      "Movie ${_isFavorite ? 'added' : 'removed'} to favorites",
      SnackbarType.success,
    );
  }

  @override
  Widget build(_) {
    return Positioned(
      top: 50,
      right: 10,
      child: FloatingActionButton(
        heroTag: 'favorite-button',
        onPressed: () => _toggleFavorite(widget.movie),
        mini: true,
        backgroundColor:
            _isFavorite ? Colors.deepPurpleAccent : Colors.grey[700],
        child: Icon(Icons.favorite),
      ),
    );
  }
}
