import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';

/// A use case class for retrieving movies from the repository.
///
/// This class provides a method to fetch a list of movies by page number
/// using the provided [MoviesRepository].
///
/// The [call] method takes an integer [page] as a parameter and returns
/// a [Future] that resolves to a [MovieResponseEntity].
class GetMoviesTopUseCase {
  final MoviesRepository repository;

  GetMoviesTopUseCase({required this.repository});

  Future<MovieResponseEntity> call(int page) {
    return repository.getMoviesTop(page);
  }
}
