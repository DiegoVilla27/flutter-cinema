import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_response_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// An abstract class that defines the base structure for movie notifiers.
///
/// The `MoviesNotifierBase` class extends `AsyncNotifier<MovieResponseEntity>` and
/// provides a foundation for managing movie-related data in an asynchronous manner.
/// It includes an abstract method `nextPage()` which is intended to be implemented
/// by subclasses to handle pagination and loading of the next page of movie data.
///
/// This class is meant to be extended by concrete movie notifier classes to
/// fetch and manage movie data from APIs or other sources, including pagination handling.
abstract class MoviesNotifierBase extends AsyncNotifier<MovieResponseEntity> {
  Future<void> nextPage();
}
