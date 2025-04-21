import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/di/injections.dart';
import 'package:flutter_cinema/core/router/router_config.dart';
import 'package:flutter_cinema/core/theme/providers/app_theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await initDI();
  runApp(ProviderScope(child: const MyApp()));
}

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
