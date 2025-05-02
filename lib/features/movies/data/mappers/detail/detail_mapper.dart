import 'package:flutter_cinema/core/environments/environments.dart';
import 'package:flutter_cinema/features/movies/data/models/detail/detail_model.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';

/// A utility class that handles the transformation of [DetailModel] objects
/// from the data layer into [DetailEntity] objects for use in the domain layer.
class DetailMapper {
  /// Converts a [DetailModel] into a [DetailEntity].
  ///
  /// This function transforms the data model retrieved from the API into a
  /// domain entity, applying necessary mapping such as:
  /// - Concatenating image paths with the base API image URL.
  /// - Converting genre models into genre entities using [GenreMapper].
  ///
  /// Parameters:
  /// - [detail]: The detail model obtained from the data source.
  ///
  /// Returns:
  /// - A [DetailEntity] with structured and formatted movie detail data.
  static DetailEntity detailModelToEntity(DetailModel detail) => DetailEntity(
    adult: detail.adult,
    backdropPath:
        (detail.backdropPath != '')
            ? '${Environments.apiImages}/${detail.backdropPath}'
            : '',
    genres:
        detail.genres
            .map((genre) => GenreMapper.genreModelToEntity(genre))
            .toList(),
    id: detail.id,
    originalTitle: detail.originalTitle,
    overview: detail.overview,
    popularity: detail.popularity,
    posterPath:
        (detail.posterPath != '')
            ? '${Environments.apiImages}/${detail.posterPath}'
            : '',
    releaseDate: detail.releaseDate,
    status: detail.status,
    title: detail.title,
    voteAverage: detail.voteAverage,
    voteCount: detail.voteCount,
  );
}

/// A utility class that transforms [GenreModel] instances from the data layer
/// into [GenreEntity] instances used in the domain layer.
class GenreMapper {
  /// Converts a [GenreModel] into a [GenreEntity].
  ///
  /// This transformation is essential for isolating the domain layer from
  /// data-specific structures or formats.
  ///
  /// Parameters:
  /// - [genre]: The genre model retrieved from the API.
  ///
  /// Returns:
  /// - A [GenreEntity] representing a genre with an [id] and [name].
  static GenreEntity genreModelToEntity(GenreModel genre) =>
      GenreEntity(id: genre.id, name: genre.name);
}
