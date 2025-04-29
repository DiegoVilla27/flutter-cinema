import 'package:flutter_cinema/core/environments/environments.dart';
import 'package:flutter_cinema/features/movies/data/models/detail/detail_model.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity.dart';

class DetailMapper {
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

class GenreMapper {
  static GenreEntity genreModelToEntity(GenreModel genre) =>
      GenreEntity(id: genre.id, name: genre.name);
}
