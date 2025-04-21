import 'package:flutter_cinema/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';

class GetMoviesUseCase {
  final MoviesRepository repository;

  GetMoviesUseCase({required this.repository});

  Future<List<MovieEntity>> call(int page) {
    return repository.getMovies(page);
  }
}
