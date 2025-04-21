import 'package:dio/dio.dart';
import 'package:flutter_cinema/features/movies/data/models/movie_model.dart';

abstract class MoviesApiDataSource {
  Future<List<MovieModel>> getMovies(int page);
}

class MoviesApiDataSourceImpl implements MoviesApiDataSource {
  final Dio dio = Dio();

  @override
  Future<List<MovieModel>> getMovies(int page) async {
    final res = await dio.get('https://api-movie.com');
    return res.data;
  }
}
