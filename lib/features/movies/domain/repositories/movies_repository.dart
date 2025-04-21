import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';

abstract class MoviesRepository {
  Future<MovieResponseEntity> getMovies(int page);
}