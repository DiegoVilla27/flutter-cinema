import 'package:flutter_cinema/core/errors/errors_handler.dart';
import 'package:flutter_cinema/features/movies/data/models/detail/detail_model_hive.dart';
import 'package:hive/hive.dart';

/// An abstract class defining methods for accessing and manipulating movie data in a local database.
///
/// This class defines the methods for saving, retrieving, and deleting movie details from a local storage (Hive).
/// The methods include operations for single movie access, retrieving all movies, and removing a movie by its ID.
abstract class DetailLocalDataSource {
  Future<void> saveDetail(DetailModelHive movie);
  Future<DetailModelHive?> getById(int id);
  Future<List<DetailModelHive>> getMovies();
  Future<void> deleteById(int id);
}

/// Implementation of the [DetailLocalDataSource] that interacts with the Hive database.
class DetailLocalDataSourceImpl implements DetailLocalDataSource {
  final Box<DetailModelHive> box = Hive.box<DetailModelHive>('detailBox');

  DetailLocalDataSourceImpl();

  /// Retrieves a movie by its unique ID from the local Hive database.
  ///
  /// Tries to fetch the movie from the `detailBox` Hive box using the provided [id].
  /// Returns a [DetailModelHive] object if the movie is found, or `null` if it does not exist.
  ///
  /// If an error occurs during the database query (such as a database access issue),
  /// it is caught and processed by the [ExceptionHandler].
  ///
  /// [id] The unique identifier of the movie to be retrieved.
  @override
  Future<DetailModelHive?> getById(int id) async {
    try {
      final detailModelHive = box.get(id);
      return detailModelHive;
    } catch (e, st) {
      throw ExceptionHandler.handle(e, st);
    }
  }

  /// Saves a movie to the local Hive database.
  ///
  /// Stores the provided [movie] object in the `detailBox` Hive box, using the movie's [id] as the key.
  /// If the movie with the same ID already exists, it will be replaced with the new [movie] object.
  ///
  /// If an error occurs during the database operation (such as an issue saving the movie to Hive),
  /// the exception is caught and passed to the [ExceptionHandler] for processing.
  ///
  /// [movie] The movie object to be saved in the local database.
  @override
  Future<void> saveDetail(DetailModelHive movie) async {
    try {
      await box.put(movie.id, movie);
    } catch (e, st) {
      throw ExceptionHandler.handle(e, st);
    }
  }

  /// Retrieves a list of all saved movies from the local Hive database.
  ///
  /// Fetches all the movie records stored in the `detailBox` Hive box and returns them as a list of [DetailModelHive] objects.
  /// The result is wrapped in a [Future], allowing asynchronous handling of the data.
  ///
  /// If an error occurs while retrieving the movies from the database (e.g., database access issues),
  /// the exception is caught and processed by the [ExceptionHandler].
  ///
  /// Returns a [List<DetailModelHive>] containing all the movie objects saved in the local database.
  @override
  Future<List<DetailModelHive>> getMovies() async {
    try {
      final movies = box.values.toList();
      return Future.value(movies);
    } catch (e, st) {
      throw ExceptionHandler.handle(e, st);
    }
  }

  /// Deletes a movie from the local Hive database by its ID.
  ///
  /// This method removes the movie with the specified [id] from the `detailBox` Hive box.
  /// It performs the deletion asynchronously, ensuring the operation is handled in the background.
  ///
  /// If an error occurs during the deletion process (e.g., database access issues),
  /// the exception is caught and processed by the [ExceptionHandler].
  ///
  /// [id] The ID of the movie to be deleted from the database.
  @override
  Future<void> deleteById(int id) async {
    try {
      await box.delete(id);
    } catch (e, st) {
      throw ExceptionHandler.handle(e, st);
    }
  }
}
