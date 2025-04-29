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

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genres': genres,
    'id': id,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate,
    'status': status,
    'title': title,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
}

class GenreModel {
  final int id;
  final String name;

  GenreModel({required this.id, required this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      GenreModel(id: json['id'] ?? 0, name: json['name'] ?? '');

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
