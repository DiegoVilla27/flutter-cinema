import 'dart:async';

import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/api/get_movie_details.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider for the `MovieDetailNotifier`, which manages the state of movie detail data.
///
/// The `movieDetailNotifierProvider` is an `AsyncNotifierProvider` that creates and manages an instance of
/// `MovieDetailNotifier`. This provider is responsible for fetching and handling the detailed information of a movie.
/// It auto-disposes when no longer in use, ensuring that the resources are cleaned up automatically.
///
/// The `MovieDetailNotifier` is expected to manage the state of a `DetailEntity`, which represents the detailed
/// information of a movie such as its title, poster, description, release date, and more.
final movieDetailNotifierProvider =
    AsyncNotifierProvider.autoDispose<MovieDetailNotifier, DetailEntity>(
      MovieDetailNotifier.new,
    );

/// A notifier that manages the state for fetching and holding movie detail information.
///
/// The `MovieDetailNotifier` is an implementation of `AutoDisposeAsyncNotifier` which handles fetching movie
/// details asynchronously and managing its state. It uses the `GetMovieDetailUseCase` to retrieve the movie details
/// from a data source and updates its state accordingly. The notifier also handles errors by showing a snack bar with
/// the error message.
class MovieDetailNotifier extends AutoDisposeAsyncNotifier<DetailEntity> {
  int? _currentId;

  /// Fetches the details of a movie by its ID.
  ///
  /// The `_fetchDetails` method calls the `GetMovieDetailUseCase` to retrieve the movie details asynchronously.
  /// If the data fetch is successful, it returns the movie details wrapped in a `Future`. If an error occurs during
  /// the fetch process, an error message is displayed using a snack bar, and the error is rethrown.
  ///
  /// Parameters:
  /// - [idMovie]: The ID of the movie for which the details are being fetched.
  ///
  /// Returns:
  /// - A `Future<DetailEntity>` representing the movie details.
  Future<DetailEntity> _fetchDetails(int idMovie) async {
    try {
      GetMovieDetailUseCase detailUseCase = di<GetMovieDetailUseCase>();
      DetailEntity detail = await detailUseCase(idMovie);
      return Future.value(detail);
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBarCustom.open(e.toString(), SnackbarType.error),
      );
      rethrow;
    }
  }

  /// Loads the details of a movie by its ID.
  ///
  /// The `loadDetails` method checks if the current movie ID is the same as the provided ID. If it is, no further action is taken.
  /// If the ID is different, it sets the state to loading and then fetches the movie details using the `_fetchDetails` method.
  /// The movie details are fetched asynchronously, and the state is updated based on the result of the fetch operation.
  ///
  /// Parameters:
  /// - [id]: The ID of the movie whose details are to be loaded.
  ///
  /// Returns:
  /// - A `Future` that resolves when the details are loaded and the state is updated.
  Future<void> loadDetails(int id) async {
    if (_currentId == id) return;
    _currentId = id;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchDetails(id));
  }

  /// Builds the initial state for the notifier.
  ///
  /// Since the notifier is responsible for fetching data asynchronously, this method throws an error when no data
  /// has been loaded yet.
  ///
  /// Returns:
  /// - A `FutureOr` of `DetailEntity` that throws an error, indicating no data is available at the moment.
  @override
  FutureOr<DetailEntity> build() {
    return Future.error('No data loaded yet');
  }
}
