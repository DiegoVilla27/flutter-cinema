import 'package:flutter_cinema/core/environments/environments.dart';
import 'package:flutter_cinema/features/movies/data/models/movie/movie_model.dart';
import 'package:flutter_cinema/features/movies/domain/entities/movie/movie_entity.dart';

/// Converts a [MovieModel] instance to a [MovieEntity] instance.
///
/// This method maps the properties of a [MovieModel] to a [MovieEntity],
/// including transforming image paths by appending the base URL from
/// [Environments.apiImages]. It handles empty image paths by returning
/// an empty string. The method also converts genre IDs to strings.
class MovieMapper {
  static MovieEntity movieModelToEntity(MovieModel movie) => MovieEntity(
    adult: movie.adult,
    backdropPath:
        (movie.backdropPath != '')
            ? '${Environments.apiImages}/${movie.backdropPath}'
            : '',
    genreIds: movie.genreIds.map((genre) => genre.toString()).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath:
        (movie.posterPath != '')
            ? '${Environments.apiImages}/${movie.posterPath}'
            : '',
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );
}
