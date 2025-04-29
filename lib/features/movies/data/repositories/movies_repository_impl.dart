import 'package:flutter_cinema/features/movies/data/data_source/movies_datasource.dart';
import 'package:flutter_cinema/features/movies/data/mappers/actor/actor_response_entity.dart';
import 'package:flutter_cinema/features/movies/data/mappers/detail/detail_mapper.dart';
import 'package:flutter_cinema/features/movies/data/mappers/movie/movie_response_mapper.dart';
import 'package:flutter_cinema/features/movies/data/models/actor/actor_response_model.dart';
import 'package:flutter_cinema/features/movies/data/models/detail/detail_model.dart';
import 'package:flutter_cinema/features/movies/data/models/movie/movie_response_model.dart';
import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_response_entity.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';

/// A repository implementation for fetching movie data from a data source.
class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesApiDataSourceImpl moviesDataSourceImpl;

  MoviesRepositoryImpl({required this.moviesDataSourceImpl});

  /// Fetches a list of movies for a given page number.
  ///
  /// This method retrieves movie data from the data source and maps it
  /// to a domain entity.
  ///
  /// [page] The page number for which to fetch movies.
  ///
  /// Returns a [Future] containing a [MovieResponseEntity] with the movie data.
  @override
  Future<MovieResponseEntity> getMoviesNow(int page) async {
    final MovieResponseModel res = await moviesDataSourceImpl.getMoviesNow(
      page,
    );
    MovieResponseEntity movieResponseEntity =
        MovieResponseMapper.movieResponseModelToEntity(res);
    return movieResponseEntity;
  }

  /// Fetches a list of movies for a given page number.
  ///
  /// This method retrieves movie data from the data source and maps it
  /// to a domain entity.
  ///
  /// [page] The page number for which to fetch movies.
  ///
  /// Returns a [Future] containing a [MovieResponseEntity] with the movie data.
  @override
  Future<MovieResponseEntity> getMoviesPopular(int page) async {
    final MovieResponseModel res = await moviesDataSourceImpl.getMoviesPopular(
      page,
    );
    MovieResponseEntity movieResponseEntity =
        MovieResponseMapper.movieResponseModelToEntity(res);
    return movieResponseEntity;
  }

  /// Fetches a list of movies for a given page number.
  ///
  /// This method retrieves movie data from the data source and maps it
  /// to a domain entity.
  ///
  /// [page] The page number for which to fetch movies.
  ///
  /// Returns a [Future] containing a [MovieResponseEntity] with the movie data.
  @override
  Future<MovieResponseEntity> getMoviesUpcoming(int page) async {
    final MovieResponseModel res = await moviesDataSourceImpl.getMoviesUpcoming(
      page,
    );
    MovieResponseEntity movieResponseEntity =
        MovieResponseMapper.movieResponseModelToEntity(res);
    return movieResponseEntity;
  }

  /// Fetches a list of movies for a given page number.
  ///
  /// This method retrieves movie data from the data source and maps it
  /// to a domain entity.
  ///
  /// [page] The page number for which to fetch movies.
  ///
  /// Returns a [Future] containing a [MovieResponseEntity] with the movie data.
  @override
  Future<MovieResponseEntity> getMoviesTop(int page) async {
    final MovieResponseModel res = await moviesDataSourceImpl.getMoviesTop(
      page,
    );
    MovieResponseEntity movieResponseEntity =
        MovieResponseMapper.movieResponseModelToEntity(res);
    return movieResponseEntity;
  }

  @override
  Future<DetailEntity> getMovieDetails(int idMovie) async {
    final DetailModel res = await moviesDataSourceImpl.getMovieDetails(idMovie);
    DetailEntity detailEntity = DetailMapper.detailModelToEntity(res);
    return detailEntity;
  }

  @override
  Future<List<ActorEntity>> getMovieActors(int idMovie) async {
    final ActorResponseModel res = await moviesDataSourceImpl.getMovieActors(
      idMovie,
    );
    List<ActorEntity> actorsEntity =
        ActorResponseMapper.actorResponseModelToEntity(res).actors;
    return actorsEntity;
  }
}
