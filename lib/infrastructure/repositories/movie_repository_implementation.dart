import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:cinemapedia/domain/repositories/movies_repositories.dart';

class MovieRepostoryImplementation extends MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MovieRepostoryImplementation(this.moviesDataSource);

  @override
  Future<List<Movie>> getNowPlaying({
    int page = 1,
  }) {
    return moviesDataSource.getNowPlaying(page: page);
  }
}
