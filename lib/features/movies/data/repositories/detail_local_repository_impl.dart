import 'package:flutter_cinema/features/movies/data/data_source/detail_local_datasource.dart';
import 'package:flutter_cinema/features/movies/data/mappers/detail/detail_mapper_hive.dart';
import 'package:flutter_cinema/features/movies/data/models/detail/detail_model_hive.dart';
import 'package:flutter_cinema/features/movies/domain/entities/detail/detail_entity_hive.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/detail_local_repository.dart';

/// Implementation of [DetailLocalRepository] that handles local data operations
/// related to movie details using a local data source and model-entity mappers.
class DetailLocalRepositoryImpl implements DetailLocalRepository {
  /// Data source implementation that interacts with Hive storage.
  final DetailLocalDataSourceImpl detailLocalDataSourceImpl;

  /// Creates an instance of [DetailLocalRepositoryImpl].
  ///
  /// Parameters:
  /// - [detailLocalDataSourceImpl]: The local data source for persistence operations.
  DetailLocalRepositoryImpl({required this.detailLocalDataSourceImpl});

  /// Retrieves a movie by its [id] from the local data source.
  ///
  /// Returns a [DetailEntityHive] if found, or `null` otherwise.
  @override
  Future<DetailEntityHive?> getById(int id) async {
    final DetailModelHive? res = await detailLocalDataSourceImpl.getById(id);
    if (res == null) return null;

    DetailEntityHive detailEntityHive = DetailHiveMapper.detailModelToEntity(
      res,
    );
    return detailEntityHive;
  }

  /// Saves a [movie] locally by mapping it to a model and delegating the operation
  /// to the data source.
  @override
  Future<void> saveDetail(DetailEntityHive movie) async {
    DetailModelHive detailModelHive = DetailHiveMapper.detailEntityToModel(
      movie,
    );
    await detailLocalDataSourceImpl.saveDetail(detailModelHive);
  }

  /// Retrieves all locally stored movies and maps them to entity objects.
  ///
  /// Returns a list of [DetailEntityHive].
  @override
  Future<List<DetailEntityHive>> getMovies() async {
    List<DetailModelHive> res = await detailLocalDataSourceImpl.getMovies();
    List<DetailEntityHive> movies =
        res
            .map((movie) => DetailHiveMapper.detailModelToEntity(movie))
            .toList();
    return movies;
  }

  /// Deletes a movie from local storage by its [id].
  @override
  Future<void> deleteById(int id) async {
    await detailLocalDataSourceImpl.deleteById(id);
  }
}
