import 'package:flutter_cinema/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/base/base_notifier.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/get_movies_popular/get_movies_popular_usecase_provider.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides an [AsyncNotifierProvider] for managing the state of movie data
/// asynchronously. The provider uses [MoviesPopularNotifier] to fetch and handle
/// movie responses, returning a [MovieResponseEntity] as the state.
final moviesPopularNotifierProvider =
    AsyncNotifierProvider<MoviesPopularNotifier, MovieResponseEntity>(
      () => MoviesPopularNotifier(),
    );

class MoviesPopularNotifier extends MoviesNotifierBase {
  int currentPage = 1;
  MovieResponseEntity moviesResponse = MovieResponseEntity(
    page: 1,
    results: [],
    dates: null,
    totalPages: 1,
    totalResults: 0,
  );

  /// Asynchronously builds and returns a [MovieResponseEntity] by invoking
  /// the [getMoviesPopularUseCase] with the current page number.
  @override
  Future<MovieResponseEntity> build() async {
    return _fetchMovies();
  }

  /// Changes the current page and fetches movies for that page.
  /// If the page is less than 1, it resets to page 1.
  /// Updates the state with the new movies data.
  @override
  Future<void> nextPage() async {
    currentPage++;
    await _updateState();
  }

  /// Fetches movies asynchronously for the current page using the
  /// [getMoviesPopularUseCaseProvider]. Displays an error snackbar if the
  /// operation fails and rethrows the exception.
  Future<MovieResponseEntity> _fetchMovies() async {
    final getMoviesPopularUseCase = ref.read(getMoviesPopularUseCaseProvider);
    try {
      MovieResponseEntity newMovies = await getMoviesPopularUseCase(
        currentPage,
      );
      _concatMovies(newMovies);
      return Future.value(moviesResponse);
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
    // state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchMovies());
  }

  void _concatMovies(MovieResponseEntity newMovies) {
    moviesResponse.page = newMovies.page;
    moviesResponse.dates = newMovies.dates;
    moviesResponse.totalPages = newMovies.totalPages;
    moviesResponse.totalResults = newMovies.totalResults;
    moviesResponse.results.addAll(newMovies.results);
  }
}
