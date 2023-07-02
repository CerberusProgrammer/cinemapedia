import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView({
    super.key,
    required this.movies,
    this.title,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 420,
        child: Column(
          children: [
            if (title != null) _Title(title: title),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return _Slide(movie: movies[index]);
                  })),
            )),
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            child: SizedBox(
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                }
                return FadeIn(child: child);
              },
            ),
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: SizedBox(
            width: 190,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text('${movie.voteAverage}'),
                const Spacer(),
                Text(
                  HumanFormats.formatNumber(movie.popularity),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;

  const _Title({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.titleLarge;

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
          if (title != null) Text(title!, style: style),
        ]));
  }
}
