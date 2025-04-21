import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/features/movies/data/data_source/movies_datasource.dart';
import 'package:flutter_cinema/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/get_movies.dart';

Future<void> initMoviesInjections() async {
  // Data sources
  di.registerLazySingleton<MoviesApiDataSourceImpl>(
    () => MoviesApiDataSourceImpl(),
  );

  // Repository
  di.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(moviesDataSourceImpl: di()),
  );

  // UseCase
  di.registerLazySingleton<GetMoviesUseCase>(
    () => GetMoviesUseCase(repository: di()),
  );
}
