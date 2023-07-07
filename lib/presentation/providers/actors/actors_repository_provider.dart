import 'package:cinemapedia/infrastructure/datasource/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<ActorRepositoryImplementation> actorsRepositoryProvider =
    Provider((ref) {
  return ActorRepositoryImplementation(ActorMovieDBDatasource());
});
