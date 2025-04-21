import 'package:flutter_cinema/core/router/router_name.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/home/home_screen.dart';
import 'package:go_router/go_router.dart';

/// A class that defines the application's routing configuration using GoRouter.
///
/// This class sets up the initial location and defines the routes for the
/// application. Each route is associated with a name and a path, and
/// uses a builder function to return the corresponding screen widget.
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: AppRouterName.home,
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
