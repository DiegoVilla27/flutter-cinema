import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/get_movies_now.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides an instance of [GetMoviesNowUseCase] using dependency injection.
/// 
/// This provider utilizes the Riverpod package to manage the state and 
/// lifecycle of the [GetMoviesNowUseCase] instance, ensuring that it is 
/// properly injected and available for use within the application.
final getNowMoviesUseCaseProvider = Provider<GetMoviesNowUseCase>((ref) {
  return di<GetMoviesNowUseCase>();
});
