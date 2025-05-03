import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/get_movies_search.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider for the `MoviesSearchNotifier` that handles searching for movies.
///
/// The `moviesSearchNotifierProvider` is an `AsyncNotifierProvider` that manages the state of searching for movies.
/// It uses the `MoviesSearchNotifier` to fetch and update the list of movies based on a search query.
///
/// The provider is set to automatically dispose of the `MoviesSearchNotifier` when it's no longer needed to prevent
/// memory leaks.
///
/// Returns:
/// - A `MovieResponseEntity` containing the list of movies matching the search query.
final moviesSearchNotifierProvider = AsyncNotifierProvider.autoDispose<
  MoviesSearchNotifier,
  MovieResponseEntity
>(MoviesSearchNotifier.new);

/// A notifier that handles searching for movies and managing their state.
///
/// The `MoviesSearchNotifier` extends `AutoDisposeAsyncNotifier` and manages the state of movie search queries.
/// It handles loading and pagination for movie results based on the search query entered by the user.
///
/// Variables:
/// - `currentQuery`: A string holding the current search query entered by the user.
/// - `currentPage`: The current page number used for pagination.
/// - `moviesResponse`: The current state of the list of movies, which is updated as new movies are fetched.
class MoviesSearchNotifier
    extends AutoDisposeAsyncNotifier<MovieResponseEntity> {
  String currentQuery = "";
  int currentPage = 1;
  MovieResponseEntity moviesResponse = MovieResponseEntity.empty();

  /// Builds the initial state for the notifier.
  ///
  /// Since the notifier is responsible for fetching data asynchronously, this method throws an error when no data
  /// has been loaded yet.
  ///
  /// Returns:
  /// - A `FutureOr` of `MovieResponseEntity` that throws an error, indicating no data is available at the moment.
  @override
  Future<MovieResponseEntity> build() async {
    return Future.value(MovieResponseEntity.empty());
  }

  /// Fetches the list of movies for the current page.
  ///
  /// This method fetches the movies for the current page by calling the `GetMoviesSearchUseCase` use case. If the request is successful,
  /// it updates the `moviesResponse` object with the new movie data. In case of an error, it shows a snack bar with the error message.
  ///
  /// Returns:
  /// - A `Future<MovieResponseEntity>`, representing the fetched movie response, which includes the movie data and pagination.
  ///
  /// Throws:
  /// - Any errors that occur during the fetching process will be rethrown after being displayed in a snack bar.
  Future<MovieResponseEntity> _fetchMovies() async {
    try {
      GetMoviesSearchUseCase moviesSearchUseCase = di<GetMoviesSearchUseCase>();
      MovieResponseEntity newMovies = await moviesSearchUseCase(
        currentQuery,
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

  /// Loads movies based on the provided search query.
  ///
  /// The `loadMovies` method sets the `currentQuery` to the provided `query`, resets the `moviesResponse` to its
  /// initial state, and then fetches the movies based on the search query by calling `_fetchMovies`.
  ///
  /// This method is typically used when the user initiates a search or filters movies by a specific query. It ensures
  /// the state is reset before fetching new results.
  ///
  /// Parameters:
  /// - [query]: A `String` representing the search query to filter movies.
  ///
  /// Returns:
  /// - A `Future<void>`, where the state is updated after fetching the movie data.
  Future<void> loadMovies(String query) async {
    resetMovies();
    currentQuery = query;
    // state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchMovies());
  }

  /// Increments the current page and fetches the next set of movies.
  ///
  /// The `nextPage` method increments the `currentPage` variable and calls `_fetchMovies` to load the next page of
  /// movie data.
  ///
  /// This method is typically called when the user reaches the end of the current list of movies and wants to load
  /// more data (e.g., infinite scrolling or pagination).
  ///
  /// It does not return a value, but triggers a state update by calling `_fetchMovies`.
  Future<void> nextPage() async {
    currentPage++;
    _fetchMovies();
  }

  /// Resets the movie search state to its initial values.
  ///
  /// This method clears the current search query and resets the current page to 1.
  /// It also sets the movies response back to its initial state and emits it as
  /// the new state using `AsyncValue.data`.
  void resetMovies() {
    currentQuery = '';
    currentPage = 1;
    moviesResponse = MovieResponseEntity.empty();
    state = AsyncValue.data(moviesResponse);
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
