import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actors_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/cast_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDBDatasource implements ActorsDatasoruce {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
      'api_key': Enviroment.movieDBKey,
      'language': 'es-MX',
    }),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieID) async {
    final response = await dio.get('/movie/$movieID/credits');

    final castResponse = CastResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map((cast) {
      return ActorsMapper.castToEntity(cast);
    }).toList();

    return actors;
  }
}
