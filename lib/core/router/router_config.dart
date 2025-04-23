import 'package:flutter_cinema/features/movies/presentation/routes/movies_routes.dart';
import 'package:go_router/go_router.dart';

/// A class that defines the application's routing configuration using GoRouter.
///
/// This class sets up the initial location and defines the routes for the
/// application. Each route is associated with a name and a path, and
/// uses a builder function to return the corresponding screen widget.
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [...moviesRoutes],
  );
}
