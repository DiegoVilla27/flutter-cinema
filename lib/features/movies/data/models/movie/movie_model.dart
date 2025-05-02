/// Data model representing a movie.
///
/// This model is part of the data layer and should be mapped to a
/// [MovieEntity] before being used in the domain or presentation layers.
class MovieModel {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  /// Creates a [MovieModel] instance from a JSON map.
  ///
  /// This method ensures that the fields are properly initialized,
  /// defaulting to appropriate values if the respective fields are
  /// missing or invalid in the JSON.
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    adult: json['adult'] ?? false,
    backdropPath: json['backdrop_path'] ?? '',
    genreIds: List<int>.from(json['genre_ids'] ?? []),
    id: json['id'] ?? 0,
    originalLanguage: json['original_language'] ?? '',
    originalTitle: json['original_title'] ?? '',
    overview: json['overview'] ?? '',
    popularity: (json['popularity'] ?? 0).toDouble(),
    posterPath: json['poster_path'] ?? '',
    releaseDate: _parseDate(json['release_date']),
    title: json['title'] ?? '',
    video: json['video'] ?? false,
    voteAverage: (json['vote_average'] ?? 0).toDouble(),
    voteCount: json['vote_count'] ?? 0,
  );

  /// Helper function to parse the release date from the JSON response.
  ///
  /// This function handles parsing the date, ensuring the correct format
  /// or returning `null` if the date is invalid or missing.
  static DateTime? _parseDate(dynamic date) {
    if (date == null || date.toString().isEmpty) return null;
    try {
      return DateTime.parse(date);
    } catch (e) {
      return null;
    }
  }
}
