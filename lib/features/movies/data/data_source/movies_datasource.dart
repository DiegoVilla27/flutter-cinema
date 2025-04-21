import 'package:dio/dio.dart';
import 'package:flutter_cinema/core/environments/environments.dart';
import 'package:flutter_cinema/features/movies/data/models/movie_response_model.dart';

/// An abstract class defining the contract for a data source that fetches
/// movie data from an API.
///
/// Implementations of this class should provide the logic to retrieve
/// movie data, specifically handling pagination through the `page` parameter.
abstract class MoviesApiDataSource {
  Future<MovieResponseModel> getMovies(int page);
}

/// A data source implementation for fetching movie data from the API.
class MoviesApiDataSourceImpl implements MoviesApiDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Environments.apiUrl,
      queryParameters: {'api_key': Environments.apiKey},
    ),
  );

  /// Fetches a list of movies currently playing in theaters.
  ///
  /// This method sends a GET request to the '/movie/now_playing' endpoint
  /// with the specified page number as a query parameter.
  ///
  /// Returns a [Future] containing a [MovieResponseModel] with the movie data.
  ///
  /// [page] The page number to retrieve.
  @override
  Future<MovieResponseModel> getMovies(int page) async {
    final res = await dio.get<MovieResponseModel>(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    return Future.value(res.data);
  }
}
