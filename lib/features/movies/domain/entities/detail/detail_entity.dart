/// Represents the detailed information of a movie or show.
///
/// This class encapsulates detailed information, including basic data
/// such as the movie's title, poster, release date, and additional details
/// like genres, popularity, vote average, and more.
class DetailEntity {
  final bool adult;
  final String backdropPath;
  final List<GenreEntity> genres;
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String status;
  final String title;
  final double voteAverage;
  final double voteCount;

  DetailEntity({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.status,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });
}

/// Represents a genre associated with a movie or show.
///
/// This class holds the information about a genre, including its
/// unique identifier and the genre's name.
class GenreEntity {
  final int id;
  final String name;

  GenreEntity({required this.id, required this.name});
}
