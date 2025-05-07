import 'dart:async';

import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/api/get_movie_actors.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider that manages the state of the movie actors data.
///
/// The `movieActorsNotifierProvider` is an `AsyncNotifierProvider` that creates and provides an instance of
/// the `MovieActorsNotifier`. It is responsible for managing the fetching and state of the list of actors
/// associated with a specific movie. The provider is auto-disposed, meaning that it will automatically
/// clean up resources when no longer in use.
///
/// This provider is used to interact with the `MovieActorsNotifier` to load and display the list of actors
/// for a given movie. It works in conjunction with `AsyncNotifier` to handle asynchronous state and error handling.
///
/// Type Parameters:
/// - `MovieActorsNotifier`: The notifier that will handle the logic for fetching and managing the state of movie actors.
/// - `List<ActorEntity>`: The type of the data being managed by the provider, which in this case is a list of `ActorEntity` objects.
final movieActorsNotifierProvider =
    AsyncNotifierProvider.autoDispose<MovieActorsNotifier, List<ActorEntity>>(
      MovieActorsNotifier.new,
    );

/// A notifier that handles the fetching and management of movie actors data.
///
/// The `MovieActorsNotifier` is an `AutoDisposeAsyncNotifier` responsible for managing the state of a list of
/// actors associated with a specific movie. It fetches the actors' data from a use case and provides the data to
/// the UI in an asynchronous manner. This class is auto-disposed, meaning it will automatically clean up resources
/// when no longer in use.
class MovieActorsNotifier extends AutoDisposeAsyncNotifier<List<ActorEntity>> {
  int? _currentId;

  /// Fetches the actors for the given movie ID.
  ///
  /// This method interacts with the `GetMovieActorsUseCase` to retrieve the list of actors for the specified movie.
  /// If the fetch is successful, the list of actors is returned. If an error occurs, a snackbar is displayed with
  /// the error message.
  ///
  /// Parameters:
  /// - [idMovie]: The unique ID of the movie for which actors are being fetched.
  ///
  /// Returns:
  /// - A `Future` that resolves to a list of `ActorEntity` objects representing the actors for the given movie.
  Future<List<ActorEntity>> _fetchActors(int idMovie) async {
    try {
      GetMovieActorsUseCase actorsUseCase = di<GetMovieActorsUseCase>();
      List<ActorEntity> actors = await actorsUseCase(idMovie);
      return Future.value(actors);
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBarCustom.open(e.toString(), SnackbarType.error),
      );
      rethrow;
    }
  }

  /// Loads the actors for a specific movie ID.
  ///
  /// This method first checks if the current movie ID matches the previously loaded movie. If they are the same,
  /// it avoids making a new request. If they are different, the method sets the state to loading and fetches the
  /// actors' data asynchronously, then updates the state with the result.
  ///
  /// Parameters:
  /// - [id]: The unique ID of the movie for which actors are being loaded.
  ///
  /// Returns:
  /// - A `Future` that resolves when the actors are loaded and the state is updated.
  Future<void> loadActors(int id) async {
    if (_currentId == id) return;
    _currentId = id;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchActors(id));
  }

  /// Builds the initial state for the notifier.
  ///
  /// Since the notifier is responsible for fetching data asynchronously, this method throws an error when no data
  /// has been loaded yet.
  ///
  /// Returns:
  /// - A `FutureOr` of `List<ActorEntity>` that throws an error, indicating no data is available at the moment.
  @override
  FutureOr<List<ActorEntity>> build() {
    return Future.error('No data loaded yet');
  }
}
