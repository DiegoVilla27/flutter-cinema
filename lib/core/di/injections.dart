import 'package:flutter_cinema/features/movies/di/movies_injection.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  // Features
  await initMoviesInjections();
}