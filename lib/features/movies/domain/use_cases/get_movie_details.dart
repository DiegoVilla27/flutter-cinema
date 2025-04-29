import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';

class GetMovieDetailUseCase {
  final MoviesRepository repository;

  GetMovieDetailUseCase({required this.repository});

  Future<DetailEntity> call(int idMovie) {
    return repository.getMovieDetails(idMovie);
  }
}
