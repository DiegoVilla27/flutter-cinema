import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/features/movies/data/data_source/detail_local_datasource.dart';
import 'package:flutter_cinema/features/movies/data/data_source/movies_datasource.dart';
import 'package:flutter_cinema/features/movies/data/repositories/detail_local_repository_impl.dart';
import 'package:flutter_cinema/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/detail_local_repository.dart';
import 'package:flutter_cinema/features/movies/domain/repositories/movies_repository.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/api/get_movie_actors.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/api/get_movie_details.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/api/get_movies_now.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/api/get_movies_popular.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/api/get_movies_search.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/api/get_movies_top.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/api/get_movies_upcoming.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/local/delete_movie.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/local/get_movie.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/local/get_movies.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/local/save_movie.dart';

/// Initializes dependency injections for the movies feature.
///
/// This function registers lazy singletons for the data source, repository,
/// and use case related to movies. It ensures that the necessary components
/// are available for dependency injection throughout the application.
Future<void> initMoviesInjections() async {
  // Data sources
  di.registerLazySingleton<MoviesApiDataSourceImpl>(
    () => MoviesApiDataSourceImpl(),
  );
  di.registerLazySingleton<DetailLocalDataSourceImpl>(
    () => DetailLocalDataSourceImpl(),
  );

  // Repository
  di.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(moviesDataSourceImpl: di()),
  );
  di.registerLazySingleton<DetailLocalRepository>(
    () => DetailLocalRepositoryImpl(detailLocalDataSourceImpl: di()),
  );

  // UseCases
  di.registerLazySingleton<GetMoviesNowUseCase>(
    () => GetMoviesNowUseCase(repository: di()),
  );
  di.registerLazySingleton<GetMoviesPopularUseCase>(
    () => GetMoviesPopularUseCase(repository: di()),
  );
  di.registerLazySingleton<GetMoviesUpcomingUseCase>(
    () => GetMoviesUpcomingUseCase(repository: di()),
  );
  di.registerLazySingleton<GetMoviesTopUseCase>(
    () => GetMoviesTopUseCase(repository: di()),
  );
  di.registerLazySingleton<GetMovieDetailUseCase>(
    () => GetMovieDetailUseCase(repository: di()),
  );
  di.registerLazySingleton<GetMovieActorsUseCase>(
    () => GetMovieActorsUseCase(repository: di()),
  );
  di.registerLazySingleton<GetMoviesSearchUseCase>(
    () => GetMoviesSearchUseCase(repository: di()),
  );

  // Hive
  di.registerLazySingleton<GetMoviesLocalUseCase>(
    () => GetMoviesLocalUseCase(repository: di()),
  );
  di.registerLazySingleton<GetMovieLocalUseCase>(
    () => GetMovieLocalUseCase(repository: di()),
  );
  di.registerLazySingleton<SaveMovieLocalUseCase>(
    () => SaveMovieLocalUseCase(repository: di()),
  );
  di.registerLazySingleton<DeleteMovieLocalUseCase>(
    () => DeleteMovieLocalUseCase(repository: di()),
  );
}
