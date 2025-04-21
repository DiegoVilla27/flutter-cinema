import 'package:flutter_cinema/features/movies/data/mappers/movie_mapper.dart';
import 'package:flutter_cinema/features/movies/data/models/movie_response_model.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie_response_entity.dart';

/// Converts a [MovieResponseModel] to a [MovieResponseEntity].
///
/// Maps the dates, page, results, total pages, and total results
/// from the model to the entity. Utilizes [DatesMapper] and
/// [MovieMapper] for nested conversions.
class MovieResponseMapper {
  static MovieResponseEntity movieResponseModelToEntity(
    MovieResponseModel movie,
  ) => MovieResponseEntity(
    dates:
        (movie.dates != null)
            ? DatesMapper.datesResponseModelToEntity(movie.dates!)
            : null,
    page: movie.page,
    results:
        movie.results
            .map((movie) => MovieMapper.movieModelToEntity(movie))
            .toList(),
    totalPages: movie.totalPages,
    totalResults: movie.totalResults,
  );
}

/// Converts a [DatesResponseModel] to a [DatesResponseEntity].
///
/// Maps the maximum and minimum date values from the model
/// to the entity.
class DatesMapper {
  static DatesResponseEntity datesResponseModelToEntity(
    DatesResponseModel model,
  ) {
    return DatesResponseEntity(maximum: model.maximum, minimum: model.minimum);
  }
}
