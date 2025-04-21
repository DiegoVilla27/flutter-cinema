import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/core/router/router_config.dart';
import 'package:flutter_cinema/core/theme/providers/app_theme_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main entry point of the Flutter application.
///
/// Loads environment variables from a .env file, initializes
/// dependency injection, and runs the app within a ProviderScope
/// to enable Riverpod state management.
void main() async {
  await dotenv.load(fileName: ".env");
  await initDI();
  runApp(ProviderScope(child: const MyApp()));
}

/// A Flutter application widget that uses Riverpod for state management
/// and MaterialApp.router for routing configuration.
///
/// This widget is a ConsumerWidget, allowing it to access providers
/// using the WidgetRef. It watches the appThemeNotifierProvider to
/// dynamically apply the app's theme. The router configuration is
/// provided by AppRouter.router.
///
/// The debug banner is disabled, and the app's title is set to
/// 'Flutter Cinema'.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(_, WidgetRef ref) {
    final appThemeNotifier = ref.watch(appThemeNotifierProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Cinema',
      theme: appThemeNotifier.get(),
      routerConfig: AppRouter.router,
    );
  }
}
