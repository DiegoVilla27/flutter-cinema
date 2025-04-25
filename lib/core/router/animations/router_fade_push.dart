import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Builds a custom page transition using [CustomTransitionPage] and applies a fade-out animation
/// when transitioning out of the current screen.
///
/// This function is typically used when navigating with methods like [push] or [pushNamed], 
/// as it provides an easy way to create custom transitions for navigation, especially when using
/// [FadeTransition]. It fades out the current screen when navigating away from it.
///
/// - [transitionDuration]: The duration for the forward (in) transition animation.
/// - [reverseTransitionDuration]: The duration for the reverse (out) transition animation.
/// - [child]: The widget that should be displayed on the page.
///
/// ### Example usage:
/// ```dart
/// GoRoute(
///   name: AppRouterName.home,
///   path: '/',
///   pageBuilder: (_, _) => buildTransitionPagePush(HomeScreen()),
/// )
/// ```
///
/// @param child The widget to display on the page.
/// @return A [CustomTransitionPage] with a fade-out transition applied.
CustomTransitionPage buildTransitionPagePush(Widget child) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 200),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(secondaryAnimation),
        child: child,
      );
    },
  );
}