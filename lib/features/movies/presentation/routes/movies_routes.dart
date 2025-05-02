import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/router/animations/router_fade_go.dart';
import 'package:flutter_cinema/core/router/router_name.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/movies_screens.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/search/search_screen.dart';
import 'package:flutter_cinema/shared/widgets/global_widgets.dart';
import 'package:go_router/go_router.dart';

/// Defines the list of routes for the movies feature, including the home route.
///
/// The `moviesRoutes` list contains `GoRoute` objects that specify the routing
/// configuration for the movies section of the application.
List<RouteBase> moviesRoutes = [
  ShellRoute(
    builder: (BuildContext context, GoRouterState state, child) {
      bool showBottomNav = _disabledBottomNavigator(context);

      return Scaffold(
        body: child,
        bottomNavigationBar:
            showBottomNav
                ? SlideInUp(child: const WaveBottomBarNavigation())
                : null,
      );
    },
    routes: [
      GoRoute(
        name: AppRouterName.home,
        path: '/',
        pageBuilder: (_, _) => buildTransitionPageGo(HomeScreen()),
      ),
      GoRoute(
        name: AppRouterName.categories,
        path: '/categories',
        pageBuilder: (_, _) => buildTransitionPageGo(CategoriesScreen()),
      ),
      GoRoute(
        name: AppRouterName.favorites,
        path: '/favorites',
        pageBuilder: (_, _) => buildTransitionPageGo(FavoritesScreen()),
      ),
      GoRoute(
        name: AppRouterName.movie,
        path: '/movie/:id',
        pageBuilder: (_, GoRouterState state) {
          final id = state.pathParameters['id']!;
          return buildTransitionPageGo(MovieScreen(id: int.parse(id)));
        },
      ),
    ],
  ),
  GoRoute(
    name: AppRouterName.search,
    path: '/search',
    pageBuilder: (_, _) {
      return buildTransitionPageGo(SearchScreen());
    },
  ),
];

/// Determines whether the bottom navigation bar should be disabled based on the current route.
///
/// This function checks the current route against a predefined list of routes that do not require
/// the bottom navigation bar. If the current route is not in the list, the bottom navigation bar
/// will be enabled; otherwise, it will be disabled.
///
/// - `context`: The build context used to get the current route information.
///
/// Returns:
/// - `true` if the bottom navigation bar should be disabled (i.e., the current route is in the
///   `routesWithoutBottomNav` list).
/// - `false` if the bottom navigation bar should be enabled.
bool _disabledBottomNavigator(BuildContext context) {
  final List<String> routesWithoutBottomNav = [AppRouterName.movie];
  return !routesWithoutBottomNav.contains(GoRouter.of(context).state.name);
}
