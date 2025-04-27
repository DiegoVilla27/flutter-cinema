import 'package:dio/dio.dart';
import 'package:flutter_cinema/core/environments/environments.dart';
import 'package:flutter_cinema/core/errors/errors_handler.dart';
import 'package:flutter_cinema/features/movies/data/models/movie_response_model.dart';

/// An abstract class defining the contract for a data source that fetches
/// movie data from an API.
///
/// Implementations of this class should provide the logic to retrieve
/// movie data, specifically handling pagination through the `page` parameter.
abstract class MoviesApiDataSource {
  Future<MovieResponseModel> getMoviesNow(int page);
  Future<MovieResponseModel> getMoviesPopular(int page);
  Future<MovieResponseModel> getMoviesUpcoming(int page);
  Future<MovieResponseModel> getMoviesTop(int page);
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
  /// Retrieves movie data from the API using the specified page number for pagination.
  /// Returns a [MovieResponseModel] containing the movie data.
  ///
  /// Throws an exception if the API call fails, which is handled by the [ExceptionHandler].
  ///
  /// [page] The page number for pagination.
  @override
  Future<MovieResponseModel> getMoviesNow(int page) async {
    try {
      final res = await dio.get(
        '/movie/now_playing',
        queryParameters: {'page': page},
      );
      MovieResponseModel movieResponseModel = MovieResponseModel.fromJson(
        res.data,
      );
      return movieResponseModel;
    } catch (e, st) {
      throw ExceptionHandler.handle(e, st);
    }
  }

  /// Fetches a list of movies currently playing in theaters.
  ///
  /// Retrieves movie data from the API using the specified page number for pagination.
  /// Returns a [MovieResponseModel] containing the movie data.
  ///
  /// Throws an exception if the API call fails, which is handled by the [ExceptionHandler].
  ///
  /// [page] The page number for pagination.
  @override
  Future<MovieResponseModel> getMoviesPopular(int page) async {
    try {
      final res = await dio.get(
        '/movie/popular',
        queryParameters: {'page': page},
      );
      MovieResponseModel movieResponseModel = MovieResponseModel.fromJson(
        res.data,
      );
      return movieResponseModel;
    } catch (e, st) {
      throw ExceptionHandler.handle(e, st);
    }
  }

  /// Fetches a list of movies currently playing in theaters.
  ///
  /// Retrieves movie data from the API using the specified page number for pagination.
  /// Returns a [MovieResponseModel] containing the movie data.
  ///
  /// Throws an exception if the API call fails, which is handled by the [ExceptionHandler].
  ///
  /// [page] The page number for pagination.
  @override
  Future<MovieResponseModel> getMoviesUpcoming(int page) async {
    try {
      final res = await dio.get(
        '/movie/upcoming',
        queryParameters: {'page': page},
      );
      MovieResponseModel movieResponseModel = MovieResponseModel.fromJson(
        res.data,
      );
      return movieResponseModel;
    } catch (e, st) {
      throw ExceptionHandler.handle(e, st);
    }
  }

  /// Fetches a list of movies currently playing in theaters.
  ///
  /// Retrieves movie data from the API using the specified page number for pagination.
  /// Returns a [MovieResponseModel] containing the movie data.
  ///
  /// Throws an exception if the API call fails, which is handled by the [ExceptionHandler].
  ///
  /// [page] The page number for pagination.
  @override
  Future<MovieResponseModel> getMoviesTop(int page) async {
    try {
      final res = await dio.get(
        '/movie/top_rated',
        queryParameters: {'page': page},
      );
      MovieResponseModel movieResponseModel = MovieResponseModel.fromJson(
        res.data,
      );
      return movieResponseModel;
    } catch (e, st) {
      throw ExceptionHandler.handle(e, st);
    }
  }
}
