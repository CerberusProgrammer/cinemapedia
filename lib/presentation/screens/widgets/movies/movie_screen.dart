import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  static const appRouterName = "movie-screen";

  final String movieID;

  const MovieScreen({
    super.key,
    required this.movieID,
  });

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('movieid: ${widget.movieID}'),
      ),
    );
  }
}
