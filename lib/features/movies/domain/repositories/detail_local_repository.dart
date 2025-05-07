import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity_hive.dart';

/// Abstract repository that defines the contract for local movie detail operations.
///
/// This interface should be implemented by any class that handles
/// local persistence of movie details, such as using Hive or other storage solutions.
abstract class DetailLocalRepository {
  /// Saves a movie to local storage.
  ///
  /// Parameters:
  /// - [movie]: The [DetailEntityHive] instance to be saved.
  ///
  /// Returns:
  /// - A [Future] that completes when the movie is saved.
  Future<void> saveDetail(DetailEntityHive movie);

  /// Retrieves a movie by its [id] from local storage.
  ///
  /// Parameters:
  /// - [id]: The ID of the movie to retrieve.
  ///
  /// Returns:
  /// - A [Future] that resolves to a [DetailEntityHive] if found, or `null` if not.
  Future<DetailEntityHive?> getById(int id);

  /// Retrieves all saved movies from local storage.
  ///
  /// Returns:
  /// - A [Future] that resolves to a [List] of [DetailEntityHive] objects.
  Future<List<DetailEntityHive>> getMovies();

  /// Deletes a movie from local storage by its [id].
  ///
  /// Parameters:
  /// - [id]: The ID of the movie to delete.
  ///
  /// Returns:
  /// - A [Future] that completes when the movie is deleted.
  Future<void> deleteById(int id);
}

