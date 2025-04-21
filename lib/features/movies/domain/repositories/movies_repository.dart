import 'package:flutter_cinema/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesRepository {
  Future<List<MovieEntity>> getMovies(int page);
}