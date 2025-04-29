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

class GenreEntity {
  final int id;
  final String name;

  GenreEntity({required this.id, required this.name});
}
