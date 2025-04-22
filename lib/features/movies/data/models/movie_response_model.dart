import 'package:flutter_cinema/features/movies/data/models/movie_model.dart';

/// A model representing the response from a movie API call, containing
/// pagination details and a list of movies.
///
/// This class provides methods to convert between JSON and the model
/// representation, facilitating easy serialization and deserialization.
///
/// Attributes:
///   dates (Dates): The date range for the movies.
///   page (int): The current page number of the results.
///   results (List<MovieModel>): A list of movies returned in the response.
///   totalPages (int): The total number of pages available.
///   totalResults (int): The total number of results available.
class MovieResponseModel {
  final DatesResponseModel dates;
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MovieResponseModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      MovieResponseModel(
        dates: DatesResponseModel.fromJson(json['dates']),
        page: json['page'] ?? 1,
        results: List<MovieModel>.from(
          json['results'].map((movie) => MovieModel.fromJson(movie)),
        ),
        totalPages: json['total_pages'] ?? 0,
        totalResults: json['total_results'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
    'dates': dates.toJson(),
    'page': page,
    'results': results.map((movie) => movie.toJson()).toList(),
    'total_pages': totalPages,
    'total_results': totalResults,
  };
}

/// A model representing a date range with maximum and minimum dates.
///
/// This class provides methods to convert between JSON and the model
/// representation, facilitating easy serialization and deserialization.
///
/// Attributes:
///   maximum (DateTime): The maximum date in the range.
///   minimum (DateTime): The minimum date in the range.
class DatesResponseModel {
  final DateTime maximum;
  final DateTime minimum;

  DatesResponseModel({required this.maximum, required this.minimum});

  factory DatesResponseModel.fromJson(Map<String, dynamic> json) =>
      DatesResponseModel(
        maximum: DateTime.parse(json['maximum']),
        minimum: DateTime.parse(json['minimum']),
      );

  Map<String, dynamic> toJson() => {
    "maximum":
        "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
    "minimum":
        "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
  };
}
