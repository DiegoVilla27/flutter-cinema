import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity_hive.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/detail_local_repository.dart';

/// Use case responsible for retrieving all locally saved movies.
///
/// This class communicates with the [DetailLocalRepository] to fetch
/// a list of movies stored in local persistence (e.g., favorites).
class GetMoviesLocalUseCase {
  final DetailLocalRepository repository;

  GetMoviesLocalUseCase({required this.repository});

  Future<List<DetailEntityHive>> call() {
    return repository.getMovies();
  }
}
