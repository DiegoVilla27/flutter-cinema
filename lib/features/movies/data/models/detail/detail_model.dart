/// Data model representing detailed information about a movie.
///
/// This model is part of the data layer and should be mapped to a
/// [DetailEntity] before being used in domain or presentation layers.
class DetailModel {
  final bool adult;
  final String backdropPath;
  final List<GenreModel> genres;
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

  DetailModel({
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

  /// Creates a [DetailModel] instance from a JSON map.
  ///
  /// - Maps the `genres` array to a list of [GenreModel].
  /// - Parses the `release_date` into a [DateTime]; defaults to now if null.
  /// - Converts numerical fields to `double` where needed.
  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
    adult: json['adult'] ?? false,
    backdropPath: json['backdrop_path'] ?? '',
    genres: List<GenreModel>.from(
      json['genres'].map((genre) => GenreModel.fromJson(genre)) ?? [],
    ),
    id: json['id'] ?? 0,
    originalTitle: json['original_title'] ?? '',
    overview: json['overview'] ?? '',
    popularity: (json['popularity'] ?? 0).toDouble(),
    posterPath: json['poster_path'] ?? '',
    releaseDate:
        (json['release_date'] != null)
            ? DateTime.parse(json['release_date'])
            : DateTime.now(),
    status: json['status'] ?? '',
    title: json['title'] ?? '',
    voteAverage: (json['vote_average'] ?? 0).toDouble(),
    voteCount: (json['vote_count'] ?? 0).toDouble(),
  );
}

/// Data model representing a genre of a movie.
///
/// This model is part of the data layer and should be mapped to a
/// [GenreEntity] before being used in the domain or presentation layers.
class GenreModel {
  final int id;
  final String name;

  GenreModel({required this.id, required this.name});

  /// Creates a [GenreModel] instance from a JSON map.
  ///
  /// This method ensures that the `id` and `name` fields are properly
  /// initialized, defaulting to 0 for the `id` and an empty string for
  /// `name` if the respective fields are missing in the JSON.
  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      GenreModel(id: json['id'] ?? 0, name: json['name'] ?? '');
}
