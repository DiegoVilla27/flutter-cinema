import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Builds a custom GoRouter page with no route-level transition, but includes
/// fade animations between screens using [AnimatedSwitcher].
///
/// This function is ideal for use within a [ShellRoute] with [goNamed] navigation,
/// such as when using a [BottomNavigationBar[. It allows you to simulate a fade
/// transition even though [goNamed[ doesn’t support custom page transitions
/// directly like [push] or [pushNamed].
///
/// A [KeyedSubtree] with a [ValueKey] based on the screen's [runtimeType] is used
/// to ensure that [AnimatedSwitcher[ detects when the widget changes and triggers
/// the appropriate transition.
///
/// - [switchInCurve]: The curve applied to the fade-in animation.
/// - [switchOutCurve]: The curve applied to the fade-out animation.
/// - [duration]: Duration of the fade-in animation.
/// - [reverseDuration]: Duration of the fade-out animation.
///
/// ### Example usage:
/// ```dart
/// GoRoute(
///   name: AppRouterName.home,
///   path: '/',
///   pageBuilder: (_, _) => buildTransitionPageGo(HomeScreen()),
/// )
/// ```
///
/// @param screen The widget representing the screen to display.
/// @return A [NoTransitionPage] wrapping an [AnimatedSwitcher] with fade animations.
NoTransitionPage<dynamic> buildTransitionPageGo(Widget screen) =>
    NoTransitionPage(
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        reverseDuration: Duration(milliseconds: 200),
        duration: Duration(milliseconds: 200),
        child: KeyedSubtree(key: ValueKey(screen.runtimeType), child: screen),
      ),
    );
