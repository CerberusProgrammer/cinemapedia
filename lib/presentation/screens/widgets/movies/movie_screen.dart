import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  static const appRouterName = "movie-screen";

  final String movieID;

  const MovieScreen({
    super.key,
    required this.movieID,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('movieid: $movieID'),
      ),
    );
  }
}
