import 'package:cinemapedia/infrastructure/datasource/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<MovieRepostoryImplementation> movieRepositoryProvider =
    Provider((ref) {
  return MovieRepostoryImplementation(MovieDbDatasource());
});
