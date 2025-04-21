import 'package:dio/dio.dart';
import 'package:flutter_cinema/core/environments/environments.dart';
import 'package:flutter_cinema/features/movies/data/models/movie_model.dart';

abstract class MoviesApiDataSource {
  Future<List<MovieModel>> getMovies(int page);
}

class MoviesApiDataSourceImpl implements MoviesApiDataSource {
  final Dio dio = Dio();

  @override
  Future<List<MovieModel>> getMovies(int page) async {
    final res = await dio.get(
      '${Environments.apiUrl}/now_playing',
      queryParameters: {'api_key': Environments.apiKey, 'page': page},
    );
    return res.data;
  }
}
