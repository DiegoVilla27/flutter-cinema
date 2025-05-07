/// Represents a simplified movie detail entity for local storage.
///
/// This model is used to store essential movie data in Hive.
class DetailEntityHive {
  final int id;
  final String posterPath;

  DetailEntityHive({
    required this.id,
    required this.posterPath
  });
}
