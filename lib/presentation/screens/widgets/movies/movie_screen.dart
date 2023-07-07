import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/movies.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const appRouterName = "movie-screen";

  final String movieID;

  const MovieScreen({
    super.key,
    required this.movieID,
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieID);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieID);
  }

  @override
  Widget build(BuildContext context) {
    final movie = ref.watch(movieInfoProvider)[widget.movieID];

    if (movie == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _MovieDetails(movie);
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}

// ignore: unused_element
class _MovieDetails extends StatelessWidget {
  final Movie movie;

  const _MovieDetails(this.movie);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Text(
              'Titulo Original: ${movie.originalTitle}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              movie.overview,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Text('Idioma Original: ${movie.originalLanguage.toUpperCase()}'),
            Text(
                'Fecha de salida: ${movie.releaseDate.day}/${movie.releaseDate.month}/${movie.releaseDate.year}'),
            Wrap(
              spacing: 5,
              children: List.generate(
                movie.genreIds.length,
                (index) => Chip(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  label: Text(
                    movie.genreIds[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * .7,
      foregroundColor: Colors.white,
      shadowColor: Colors.red,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        title: Text(
          movie.title,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        background: _BackGroundPortrait(movie: movie),
      ),
    );
  }
}

class _BackGroundPortrait extends StatelessWidget {
  const _BackGroundPortrait({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            movie.posterPath,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                  0.7,
                  1
                ],
                    colors: [
                  Colors.transparent,
                  Color.fromARGB(255, 33, 33, 33),
                ])),
          ),
        ),
        const SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                stops: [0, 0.2],
                colors: [
                  Color.fromARGB(255, 33, 33, 33),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
