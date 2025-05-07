import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity_hive.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/detail_local_repository.dart';

/// Use case responsible for retrieving a single movie by its ID from local storage.
///
/// This class interacts with the [DetailLocalRepository] to fetch a
/// locally stored movie, typically used to check if a movie is marked as favorite.
class GetMovieLocalUseCase {
  final DetailLocalRepository repository;

  GetMovieLocalUseCase({required this.repository});

  Future<DetailEntityHive?> call(int id) {
    return repository.getById(id);
  }
}
