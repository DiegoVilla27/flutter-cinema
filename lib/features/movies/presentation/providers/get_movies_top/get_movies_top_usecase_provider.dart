import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/get_movies_top.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides an instance of [GetMoviesTopUseCase] using dependency injection.
///
/// This provider utilizes the Riverpod package to manage the state and
/// lifecycle of the [GetMoviesTopUseCase] instance, ensuring that it is
/// properly injected and available for use within the application.
final getMoviesTopUseCaseProvider = Provider<GetMoviesTopUseCase>((ref) {
  return di<GetMoviesTopUseCase>();
});
