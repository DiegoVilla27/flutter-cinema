import 'package:flutter_cinema/features/movies/domain/repositories/detail_local_repository.dart';

/// Use case responsible for deleting a movie from local storage by its ID.
///
/// This class interacts with the [DetailLocalRepository] to remove
/// a locally stored movie, typically used when a user unfavorites a movie.
class DeleteMovieLocalUseCase {
  final DetailLocalRepository repository;

  DeleteMovieLocalUseCase({required this.repository});

  Future<void> call(int id) {
    return repository.deleteById(id);
  }
}
