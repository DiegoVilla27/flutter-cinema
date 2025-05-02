import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/features/movies/domain/entities/actor/actor_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A widget that displays a horizontal list of actors associated with a movie.
///
/// This widget takes an `AsyncValue` containing a list of `ActorEntity` objects and renders
/// a horizontal list of actor profile images. The list is displayed using a `ListView.builder`,
/// and each actor's name is shown below their image with a tooltip that displays their name when hovered over.
///
/// Each actor's image is fetched from the network, with loading and error handling mechanisms in place.
/// A gradient overlay is applied to the actor's image to improve text readability. The actor's name is displayed
/// at the bottom of their image with a limited character width, and the text is truncated if it overflows.
///
/// Parameters:
/// - [actorsAsync]: An `AsyncValue` that contains the list of `ActorEntity` objects. The widget reacts
///   to changes in the state of this async value (loading, error, or data).
///
/// Returns:
/// - A `SizedBox` containing a horizontal `ListView.builder` widget that displays actor profile images.
class MovieActors extends StatelessWidget {
  final AsyncValue<List<ActorEntity>> actorsAsync;

  const MovieActors({super.key, required this.actorsAsync});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: actorsAsync.when(
        data:
            (actors) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 140,
              itemCount: actors.length,
              itemBuilder: (_, index) {
                final actor = actors[index];
                return ZoomIn(
                  child: Tooltip(
                    message: actor.name,
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Stack(
                          children: [
                            Image.network(
                              actor.profilePath!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              loadingBuilder: (_, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  width: double.infinity,
                                  color: Colors.black12,
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: double.infinity,
                                  color: Colors.white10,
                                  child: Center(
                                    child: Icon(
                                      Icons.photo_size_select_actual_rounded,
                                      size: 40,
                                    ),
                                  ),
                                );
                              },
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
                            Positioned(
                              bottom: 5,
                              right: 8,
                              left: 8,
                              child: Text(
                                actor.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) {
          return Text(e.toString());
        },
      ),
    );
  }
}
