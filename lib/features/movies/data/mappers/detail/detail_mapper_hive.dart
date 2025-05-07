import 'package:flutter_cinema/features/movies/data/models/detail/detail_model_hive.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity_hive.dart';

/// A utility class for mapping between [DetailModelHive] and [DetailEntityHive].
///
/// This class provides static methods to convert between the Hive model (`DetailModelHive`) and
/// the domain entity (`DetailEntityHive`). It helps to maintain separation between
/// the database layer (Hive) and the domain layer (business logic).
class DetailHiveMapper {
  static DetailEntityHive detailModelToEntity(DetailModelHive detail) =>
      DetailEntityHive(id: detail.id, posterPath: detail.posterPath);

  static DetailModelHive detailEntityToModel(DetailEntityHive detail) =>
      DetailModelHive(id: detail.id, posterPath: detail.posterPath);
}
