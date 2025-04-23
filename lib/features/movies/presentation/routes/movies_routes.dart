import 'package:flutter_cinema/core/router/router_name.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/movies_screens.dart';
import 'package:go_router/go_router.dart';

/// Defines the list of routes for the movies feature, including the home route.
///
/// The `moviesRoutes` list contains `GoRoute` objects that specify the routing
/// configuration for the movies section of the application.
List<RouteBase> moviesRoutes = [
  GoRoute(
    name: AppRouterName.home,
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
];
