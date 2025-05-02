import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';

/// Use case to search for movies based on a query.
///
/// This use case retrieves a list of movies that match a search query from the repository layer.
/// It encapsulates the logic for searching movies, promoting cleaner architecture and separation of concerns.
///
/// Methods:
/// - `call`: Searches for movies based on the provided query and page number.
///   Returns a [Future] containing the [MovieResponseEntity] with the search results.
class GetMoviesSearchUseCase {
  final MoviesRepository repository;

  GetMoviesSearchUseCase({required this.repository});

  Future<MovieResponseEntity> call(String query, int page) {
    return repository.getMoviesSearch(query, page);
  }
}
