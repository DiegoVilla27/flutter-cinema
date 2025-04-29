import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_response_entity.dart';

abstract class MoviesRepository {
  Future<MovieResponseEntity> getMoviesNow(int page);
  Future<MovieResponseEntity> getMoviesPopular(int page);
  Future<MovieResponseEntity> getMoviesUpcoming(int page);
  Future<MovieResponseEntity> getMoviesTop(int page);
  Future<DetailEntity> getMovieDetails(int idMovie);
  Future<List<ActorEntity>> getMovieActors(int idMovie);
}
