import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/get_movies_upcoming.dart';
import 'package:flutter_cinema/features/movies/presentation/providers/base/base_notifier.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider for managing the state of movies that are currently upcoming.
///
/// The `moviesUpcomingNotifierProvider` is an `AsyncNotifierProvider` that provides an instance of `MoviesUpcomingNotifier`
/// and its associated state, which is a `MovieResponseEntity`. The state represents the list of movies that are currently
/// upcoming.
final moviesUpcomingNotifierProvider =
    AsyncNotifierProvider<MoviesUpcomingNotifier, MovieResponseEntity>(
      () => MoviesUpcomingNotifier(),
    );

/// A notifier responsible for fetching and managing the state of currently upcoming movies.
///
/// The `MoviesUpcomingNotifier` extends `MoviesNotifierBase` and manages the state of a list of currently upcoming movies,
/// including handling pagination (for fetching additional pages of results) and updating the UI state accordingly.
///
/// It interacts with a use case (`GetMoviesUpcomingUseCase`) to fetch the list of currently upcoming movies from an API or database.
/// The state is represented by a `MovieResponseEntity`, which contains the movie results and pagination information.
class MoviesUpcomingNotifier extends MoviesNotifierBase {
  int currentPage = 1;
  MovieResponseEntity moviesResponse = MovieResponseEntity(
    page: 1,
    results: [],
    dates: null,
    totalPages: 1,
    totalResults: 0,
  );

  /// Builds the notifier's state by fetching the movie data.
  ///
  /// This method is called when the notifier is created and is responsible for initializing the data fetching process.
  /// It uses the `_fetchMovies` method to load the list of currently upcoming movies and return it wrapped in an `AsyncValue`.
  ///
  /// Returns:
  /// - A `Future<MovieResponseEntity>` containing the list of currently upcoming movies, which will be used to update the state of the notifier.
  @override
  Future<MovieResponseEntity> build() async {
    return _fetchMovies();
  }

  /// Increments the current page and loads the next set of movies.
  ///
  /// This method is responsible for fetching the next page of movies. It increments the `currentPage` and then updates the notifier's state
  /// by calling `_updateState`. This will fetch the movies for the next page and update the state accordingly.
  ///
  /// Returns:
  /// - A `Future<void>`, indicating that the operation has completed.
  @override
  Future<void> nextPage() async {
    currentPage++;
    await _updateState();
  }

  /// Fetches the list of movies for the current page.
  ///
  /// This method fetches the movies for the current page by calling the `GetMoviesUpcomingUseCase` use case. If the request is successful,
  /// it updates the `moviesResponse` object with the new movie data. In case of an error, it shows a snack bar with the error message.
  ///
  /// Returns:
  /// - A `Future<MovieResponseEntity>`, representing the fetched movie response, which includes the movie data and pagination.
  ///
  /// Throws:
  /// - Any errors that occur during the fetching process will be rethrown after being displayed in a snack bar.
  Future<MovieResponseEntity> _fetchMovies() async {
    try {
      GetMoviesUpcomingUseCase moviesUpcomingUseCase =
          di<GetMoviesUpcomingUseCase>();
      MovieResponseEntity newMovies = await moviesUpcomingUseCase(currentPage);
      _concatMovies(newMovies);
      return Future.value(moviesResponse);
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBarCustom.open(e.toString(), SnackbarType.error),
      );
      rethrow;
    }
  }

  /// Updates the state with the fetched movies.
  ///
  /// This method updates the state by calling the `_fetchMovies()` method inside an `AsyncValue.guard` to handle loading and error states.
  /// It sets the state to a loading state initially and then updates it with the result of the `_fetchMovies()` method.
  ///
  /// This method ensures that the state is correctly managed, allowing the UI to reflect the loading, success, or error states.
  ///
  /// Returns:
  /// - A `Future<void>`, representing the completion of the state update process.
  Future<void> _updateState() async {
    // state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchMovies());
  }

  /// Concatenates new movies to the existing movie response.
  ///
  /// This method updates the current `moviesResponse` by merging the data from the newly fetched `newMovies`.
  /// It updates the `page`, `dates`, `totalPages`, `totalResults`, and appends the new list of movie results to the existing ones.
  ///
  /// This ensures that the movie list is incrementally updated when new movies are fetched, without overwriting the existing ones.
  ///
  /// Parameters:
  /// - [newMovies]: A `MovieResponseEntity` containing the newly fetched movies and their metadata.
  ///
  /// Returns:
  /// - Nothing. This method directly updates the `moviesResponse` object.
  void _concatMovies(MovieResponseEntity newMovies) {
    moviesResponse.page = newMovies.page;
    moviesResponse.dates = newMovies.dates;
    moviesResponse.totalPages = newMovies.totalPages;
    moviesResponse.totalResults = newMovies.totalResults;
    moviesResponse.results.addAll(newMovies.results);
  }
}
