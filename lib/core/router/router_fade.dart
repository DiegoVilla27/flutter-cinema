import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Creates a custom page with a fade transition for navigation.
///
/// This function returns a [CustomTransitionPage] that applies a fade effect
/// when navigating between routes. The transition duration is 200 milliseconds
/// for both push and pop actions.
///
/// The fade-out animation is applied to the previous page during navigation
/// using [secondaryAnimation].
///
/// [child] is the content of the page.
CustomTransitionPage buildFadePage(Widget child) {
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
