import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';

/// Use case to fetch the list of actors for a specific movie.
///
/// This use case fetches the list of actors associated with a given movie
/// by interacting with the repository layer. It encapsulates the logic
/// for retrieving movie actors and returns a list of actor entities.
///
/// The use case ensures that the business logic related to fetching actors
/// is separated from the rest of the application, promoting cleaner architecture.
///
/// Methods:
/// - `call`: Fetches the actors for a given movie using the repository.
///   Returns a [Future] containing a list of [ActorEntity] objects.
class GetMovieActorsUseCase {
  final MoviesRepository repository;

  GetMovieActorsUseCase({required this.repository});

  Future<List<ActorEntity>> call(int idMovie) {
    return repository.getMovieActors(idMovie);
  }
}
