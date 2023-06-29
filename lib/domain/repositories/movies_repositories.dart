import '../entities/movies.dart';

abstract class Movierepository {
  Future<List<Movie>> getNowPlaying({
    int page = 1,
  });
}
