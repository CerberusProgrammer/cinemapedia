import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repositories.dart';

import '../../domain/datasources/actors_datasource.dart';

class ActorRepositoryImplementation extends ActorsRepository {
  final ActorsDatasoruce datasource;

  ActorRepositoryImplementation(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieID) async {
    return datasource.getActorsByMovie(movieID);
  }
}
