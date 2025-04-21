import 'package:flutter_cinema/features/movies/data/data_source/movies_datasource.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesApiDataSourceImpl moviesDataSourceImpl;

  MoviesRepositoryImpl({required this.moviesDataSourceImpl});

  @override
  Future<List<MovieEntity>> getMovies(int page) async {
    try {
      final List<MovieEntity> res = await moviesDataSourceImpl.getMovies(page);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
