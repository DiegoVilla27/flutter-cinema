import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';

/// A use case class for retrieving movies from the repository.
///
/// This class provides a method to fetch a list of movies by page number
/// using the provided [MoviesRepository].
///
/// The [call] method takes an integer [page] as a parameter and returns
/// a [Future] that resolves to a [MovieResponseEntity].
class GetMoviesPopularUseCase {
  final MoviesRepository repository;

  GetMoviesPopularUseCase({required this.repository});

  Future<MovieResponseEntity> call(int page) {
    return repository.getMoviesPopular(page);
  }
}
