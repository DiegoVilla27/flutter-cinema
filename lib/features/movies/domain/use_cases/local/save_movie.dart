import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity_hive.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/detail_local_repository.dart';

/// Use case responsible for saving a movie to local storage.
///
/// This class acts as an abstraction over the local repository and is used
/// to save a [DetailEntityHive] instance (e.g., a favorite movie) into Hive.
class SaveMovieLocalUseCase {
  final DetailLocalRepository repository;

  SaveMovieLocalUseCase({required this.repository});

  Future<void> call(DetailEntityHive movie) {
    return repository.saveDetail(movie);
  }
}
