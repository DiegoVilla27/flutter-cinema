import 'package:flutter_cinema/features/movies/data/mappers/movie_mapper.dart';
import 'package:flutter_cinema/features/movies/data/models/movie_response_model.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';

/// Converts a [MovieResponseModel] to a [MovieResponseEntity].
///
/// Maps the dates, page, results, total pages, and total results
/// from the model to the entity. Utilizes [DatesResponseMapper] and
/// [MovieMapper] for nested conversions.
class MovieResponseMapper {
  static MovieResponseEntity movieResponseModelToEntity(
    MovieResponseModel movieResponse,
  ) => MovieResponseEntity(
    dates:
        (movieResponse.dates != null)
            ? DatesResponseMapper.datesResponseModelToEntity(
              movieResponse.dates!,
            )
            : null,
    page: movieResponse.page,
    results:
        movieResponse.results
            .map((movie) => MovieMapper.movieModelToEntity(movie))
            .toList(),
    totalPages: movieResponse.totalPages,
    totalResults: movieResponse.totalResults,
  );
}

/// Converts a [DatesResponseModel] to a [DatesResponseEntity].
///
/// Maps the maximum and minimum date values from the model
/// to the entity.
class DatesResponseMapper {
  static DatesResponseEntity datesResponseModelToEntity(
    DatesResponseModel dates,
  ) => DatesResponseEntity(maximum: dates.maximum, minimum: dates.minimum);
}
