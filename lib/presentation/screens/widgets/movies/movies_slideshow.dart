import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  const MoviesSlideshow({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.85,
        autoplay: true,
        itemCount: movies.length,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: themeColor.primary,
            color: themeColor.secondary.withAlpha(100),
          ),
        ),
        itemBuilder: (context, index) => _Slide(movie: movies[index]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Card(
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const DecoratedBox(
                    decoration: BoxDecoration(
                  color: Colors.black12,
                ));
              }

              return FadeIn(
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
