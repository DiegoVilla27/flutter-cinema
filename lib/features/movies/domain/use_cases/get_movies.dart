import 'package:flutter_cinema/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';

/// A use case class for retrieving a list of movies from the repository.
///
/// This class interacts with the [MoviesRepository] to fetch a list of
/// [MovieEntity] objects based on the provided page number.
///
/// The [call] method takes an integer [page] as a parameter and returns
/// a [Future] containing a list of [MovieEntity] objects.
class GetMoviesUseCase {
  final MoviesRepository repository;

  GetMoviesUseCase({required this.repository});

  Future<List<MovieEntity>> call(int page) {
    return repository.getMovies(page);
  }
}
