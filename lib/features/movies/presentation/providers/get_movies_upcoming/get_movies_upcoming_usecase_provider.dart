import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/features/movies/domain/use_cases/get_movies_upcoming.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides an instance of [GetMoviesUpcomingUseCase] using dependency injection.
///
/// This provider utilizes the Riverpod package to manage the state and
/// lifecycle of the [GetMoviesUpcomingUseCase] instance, ensuring that it is
/// properly injected and available for use within the application.
final getMoviesUpcomingUseCaseProvider = Provider<GetMoviesUpcomingUseCase>((
  ref,
) {
  return di<GetMoviesUpcomingUseCase>();
});
