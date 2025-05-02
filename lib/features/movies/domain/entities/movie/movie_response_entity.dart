import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_entity.dart';

/// Represents the response model for a movie API call, containing
/// pagination details and a list of movie entities.
/// 
/// Attributes:
/// - [dates]: Date range for the movies.
/// - [page]: Current page number of the results.
/// - [results]: List of movies returned in the response.
/// - [totalPages]: Total number of pages available.
/// - [totalResults]: Total number of movie results available.
class MovieResponseEntity {
  DatesResponseEntity? dates;
  int page;
  List<MovieEntity> results;
  int totalPages;
  int totalResults;

  MovieResponseEntity({
    this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

/// Represents a date range with a maximum and minimum date.
/// 
/// Attributes:
/// - `maximum`: The latest date in the range.
/// - `minimum`: The earliest date in the range.
class DatesResponseEntity {
  DateTime maximum;
  DateTime minimum;

  DatesResponseEntity({required this.maximum, required this.minimum});
}
