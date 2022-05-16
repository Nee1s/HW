import 'movie_model.dart';

export 'package:hw/utilities/modify_model.dart';

export 'movie_model.dart';
export 'movie_model_constructor.dart' show Lang, ConvertLangToStr;

class MovieContentModel {
  final List<MovieModel> localMovies;

  const MovieContentModel({required this.localMovies});
}
