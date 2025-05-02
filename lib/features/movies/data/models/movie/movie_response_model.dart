import 'package:flutter_cinema/features/movies/data/models/movie/movie_model.dart';

/// Data model representing a response containing a list of movies.
///
/// This model represents the structure of the response returned from
/// an API endpoint that provides paginated movie results. It includes
/// metadata about the search (pagination details) and a list of movies.
class MovieResponseModel {
  final DatesResponseModel? dates;
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MovieResponseModel({
    this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  /// Creates a [MovieResponseModel] instance from a JSON map.
  ///
  /// This method initializes the [MovieResponseModel] from a JSON object,
  /// ensuring that all fields are properly populated, including handling
  /// the optional `dates` field and mapping the `results` list to a list of
  /// [MovieModel] instances.
  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      MovieResponseModel(
        dates:
            (json['dates'] != null)
                ? DatesResponseModel.fromJson(json['dates'])
                : null,
        page: json['page'] ?? 1,
        results: List<MovieModel>.from(
          json['results'].map((movie) => MovieModel.fromJson(movie)),
        ),
        totalPages: json['total_pages'] ?? 0,
        totalResults: json['total_results'] ?? 0,
      );
}

/// Data model representing the pagination date range in a movie response.
///
/// This model contains the start and end dates that define the range of
/// available movies in a paginated API response. It includes the `maximum`
/// and `minimum` dates, which are used to filter movie results by date.
class DatesResponseModel {
  final DateTime maximum;
  final DateTime minimum;

  DatesResponseModel({required this.maximum, required this.minimum});

  /// Creates a [DatesResponseModel] instance from a JSON map.
  ///
  /// This method initializes the [DatesResponseModel] from a JSON object,
  /// parsing the `maximum` and `minimum` date strings into [DateTime] objects.
  factory DatesResponseModel.fromJson(Map<String, dynamic> json) =>
      DatesResponseModel(
        maximum: DateTime.parse(json['maximum']),
        minimum: DateTime.parse(json['minimum']),
      );
}
