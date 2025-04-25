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
    builder: (_, _, child) {
      return Scaffold(
        body: SafeArea(child: SingleChildScrollView(child: child)),
        bottomNavigationBar: const WaveBottomBarNavigation(),
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
    ],
  ),
];
