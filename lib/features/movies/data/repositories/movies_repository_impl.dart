import 'package:flutter_cinema/features/movies/data/data_source/movies_datasource.dart';
import 'package:flutter_cinema/features/movies/data/mappers/movie_response_mapper.dart';
import 'package:flutter_cinema/features/movies/data/models/movie_response_model.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';
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
  Future<MovieResponseEntity> getMovies(int page) async {
    final MovieResponseModel res = await moviesDataSourceImpl.getMovies(page);
    MovieResponseEntity movieResponseEntity =
        MovieResponseMapper.movieResponseModelToEntity(res);
    return movieResponseEntity;
  }
}
