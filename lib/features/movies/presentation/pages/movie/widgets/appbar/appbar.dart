import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieAppBar extends StatelessWidget {
  final String title;
  final String posterPath;

  const MovieAppBar({super.key, required this.title, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            background: Stack(
              children: [
                SizedBox.expand(
                  child: Image.network(posterPath, fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.5, 1.0],
                        colors: [Colors.transparent, Colors.black],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: FloatingActionButton(
              onPressed: () => context.pop(),
              mini: true,
              backgroundColor: Colors.deepPurpleAccent,
              child: Icon(Icons.chevron_left),
            ),
          ),
        ],
      ),
    );
  }
}
