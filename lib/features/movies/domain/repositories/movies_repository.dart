import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';

abstract class MoviesRepository {
  Future<MovieResponseEntity> getMoviesNow(int page);
  Future<MovieResponseEntity> getMoviesPopular(int page);
  Future<MovieResponseEntity> getMoviesUpcoming(int page);
  Future<MovieResponseEntity> getMoviesTop(int page);
}
