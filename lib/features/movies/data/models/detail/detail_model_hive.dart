import 'package:hive/hive.dart';
part 'detail_model_hive.g.dart';

/// Hive model class representing a movie's detail data.
///
/// This class is used to map the movie data in the local Hive storage. It
/// contains the movie's ID and poster path.
///
/// It is annotated with [HiveType] and [HiveField] for Hive serialization.
@HiveType(typeId: 1)
class DetailModelHive extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String posterPath;

  DetailModelHive({required this.id, required this.posterPath});
}