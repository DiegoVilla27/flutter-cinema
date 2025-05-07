import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/core/router/router_config.dart';
import 'package:flutter_cinema/core/states/scaffold/scaffold_key_state.dart';
import 'package:flutter_cinema/core/theme/providers/app_theme_provider.dart';
import 'package:flutter_cinema/features/movies/data/models/detail/detail_model_hive.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// The main entry point of the Flutter application.
///
/// Initialize Hive box and environment variables from a .env file, initializes
/// dependency injection, and runs the app within a ProviderScope
/// to enable Riverpod state management.
void main() async {
  // Init Hive
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(DetailModelHiveAdapter());
  await Hive.openBox<DetailModelHive>('detailBox');
  // Init Dotenv
  await dotenv.load(fileName: ".env");
  // Init DI
  await initDI();
  // Init Riverpod
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
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
