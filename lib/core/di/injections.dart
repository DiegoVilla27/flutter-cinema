import 'package:flutter_cinema/features/movies/di/movies_injection.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

/// Initializes the dependency injection (DI) system for the application.
///
/// This function sets up the necessary injections for various features,
/// starting with the movies feature. It ensures that all required
/// dependencies are registered and ready for use throughout the app.
Future<void> initDI() async {
  // Features
  await initMoviesInjections();
}
