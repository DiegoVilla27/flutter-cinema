import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';

/// Use case to fetch the details of a specific movie.
///
/// This use case retrieves detailed information about a movie from the repository layer.
/// It encapsulates the logic for fetching the movie details, ensuring that the
/// business logic is separated from the rest of the application, promoting cleaner architecture.
///
/// Methods:
/// - `call`: Fetches the details of the given movie using the repository.
///   Returns a [Future] containing the [DetailEntity] object with the movie details.
class GetMovieDetailUseCase {
  final MoviesRepository repository;

  GetMovieDetailUseCase({required this.repository});

  Future<DetailEntity> call(int idMovie) {
    return repository.getMovieDetails(idMovie);
  }
}
