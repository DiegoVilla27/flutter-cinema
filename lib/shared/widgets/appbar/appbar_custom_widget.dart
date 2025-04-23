import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SafeArea(
      bottom: false,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 0.0,
            top: 4.0,
            bottom: 4.0,
          ),
          child: Row(
            children: [
              Icon(Icons.movie, color: theme.primary),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Cinema",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
        ),
      ),
    );
  }
}
