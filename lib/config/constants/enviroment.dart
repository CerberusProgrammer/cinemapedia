import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String movieDBKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No API Key';
}
