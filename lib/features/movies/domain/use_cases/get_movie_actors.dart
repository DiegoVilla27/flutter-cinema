import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';

class GetMovieActorsUseCase {
  final MoviesRepository repository;

  GetMovieActorsUseCase({required this.repository});

  Future<List<ActorEntity>> call(int idMovie) {
    return repository.getMovieActors(idMovie);
  }
}
