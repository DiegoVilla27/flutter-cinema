import 'package:dio/dio.dart';
import 'package:flutter_cinema/core/environments/environments.dart';
import 'package:flutter_cinema/core/errors/errors_handler.dart';
import 'package:flutter_cinema/features/movies/data/models/actor/actor_response_model.dart';
import 'package:flutter_cinema/features/movies/data/models/detail/detail_model.dart';
import 'package:flutter_cinema/features/movies/data/models/movie/movie_response_model.dart';

/// An abstract class defining the contract for a data source that fetches
/// movie data from an API.
abstract class MoviesApiDataSource {
  Future<MovieResponseModel> getMoviesNow(int page);
  Future<MovieResponseModel> getMoviesPopular(int page);
  Future<MovieResponseModel> getMoviesUpcoming(int page);
  Future<MovieResponseModel> getMoviesTop(int page);
  Future<DetailModel> getMovieDetails(int idMovie);
  Future<ActorResponseModel> getMovieActors(int idMovie);
  Future<MovieResponseModel> getMoviesSearch(String query, int page);
}

/// A data source implementation for fetching movie data from the API.
class MoviesApiDataSourceImpl implements MoviesApiDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Environments.apiUrl,
      queryParameters: {'api_key': Environments.apiKey, 'language': 'en-EN'},
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

  /// Fetches detailed information for a specific movie from the API.
  ///
  /// This function performs a GET request to the `/movie/{idMovie}` endpoint using Dio,
  /// decodes the JSON response into a [DetailModel], and returns it.
  ///
  /// Parameters:
  /// - [idMovie]: The ID of the movie to fetch details for.
  ///
  /// Throws:
  /// - An exception processed by [ExceptionHandler.handle] if the request fails.
  ///
  /// Returns:
  /// - A [DetailModel] containing the movie details.
  @override
  Future<DetailModel> getMovieDetails(int idMovie) async {
    try {
      final res = await dio.get('/movie/$idMovie');
      DetailModel detailModel = DetailModel.fromJson(res.data);
      return detailModel;
    } catch (e, st) {
      throw ExceptionHandler.handle(e, st);
    }
  }

  /// Fetches the list of actors (cast) for a specific movie from the API.
  ///
  /// Performs a GET request to the `/movie/{idMovie}/credits` endpoint,
  /// parses the JSON response into an [ActorResponseModel] and returns it.
  ///
  /// Parameters:
  /// - [idMovie]: The ID of the movie whose cast information is being requested.
  ///
  /// Throws:
  /// - An exception processed by [ExceptionHandler.handle] if the request fails.
  ///
  /// Returns:
  /// - An [ActorResponseModel] containing a list of actors involved in the movie.
  @override
  Future<ActorResponseModel> getMovieActors(int idMovie) async {
    try {
      final res = await dio.get('/movie/$idMovie/credits');
      ActorResponseModel actorResponseModel = ActorResponseModel.fromJson(
        res.data,
      );
      return actorResponseModel;
    } catch (e, st) {
      throw ExceptionHandler.handle(e, st);
    }
  }

  /// Fetches a paginated list of movies based on a search query from the API.
  ///
  /// Sends a GET request to the `/search/movie` endpoint with the specified
  /// query and page number. The JSON response is parsed into a [MovieResponseModel].
  ///
  /// Parameters:
  /// - [query]: The search keyword to find matching movies.
  /// - [page]: The page number for pagination (starts from 1).
  ///
  /// Throws:
  /// - An exception processed by [ExceptionHandler.handle] if the request fails.
  ///
  /// Returns:
  /// - A [MovieResponseModel] containing a list of matched movies and pagination data.
  @override
  Future<MovieResponseModel> getMoviesSearch(String query, int page) async {
    try {
      final res = await dio.get(
        '/search/movie',
        queryParameters: {'query': query, 'page': page},
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
