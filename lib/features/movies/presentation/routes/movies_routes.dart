import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/router/animations/router_fade_go.dart';
import 'package:flutter_cinema/core/router/router_name.dart';
import 'package:flutter_cinema/features/movies/presentation/pages/movies_screens.dart';
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
        body: SafeArea(child: child),
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
];

bool _disabledBottomNavigator(BuildContext context) {
  final List<String> routesWithoutBottomNav = [AppRouterName.movie];
  return !routesWithoutBottomNav.contains(GoRouter.of(context).state.name);
}
