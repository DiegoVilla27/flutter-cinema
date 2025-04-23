import 'package:flutter_cinema/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies/movies_usecase_provider.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides an [AsyncNotifierProvider] for managing the state of movie data
/// asynchronously. The provider uses [MoviesNotifier] to fetch and handle
/// movie responses, returning a [MovieResponseEntity] as the state.
final moviesNotifierProvider =
    AsyncNotifierProvider<MoviesNotifier, MovieResponseEntity>(
      () => MoviesNotifier(),
    );

class MoviesNotifier extends AsyncNotifier<MovieResponseEntity> {
  int _currentPage = 1;

  /// Asynchronously builds and returns a [MovieResponseEntity] by invoking
  /// the getMoviesUseCase with the current page number.
  @override
  Future<MovieResponseEntity> build() async {
    return _fetchMovies();
  }

  /// Changes the current page and fetches movies for that page.
  /// If the page is less than 1, it resets to page 1.
  /// Updates the state with the new movies data.
  Future<void> changePage(int page) async {
    if (page < 1) _currentPage = 1;
    _currentPage = page;
    await _updateState();
  }

  /// Fetches movies asynchronously for the current page using the
  /// [getMoviesUseCaseProvider]. Displays an error snackbar if the
  /// operation fails and rethrows the exception.
  Future<MovieResponseEntity> _fetchMovies() async {
    final getMoviesUseCase = ref.read(getMoviesUseCaseProvider);

    try {
      return await getMoviesUseCase(_currentPage);
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBarCustom.open(e.toString(), SnackbarType.error),
      );
      rethrow;
    }
  }

  /// Updates the state by setting it to [AsyncLoading] initially, then
  /// attempts to fetch movies asynchronously, updating the state with
  /// the result of the fetch operation.
  Future<void> _updateState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchMovies());
  }
}
