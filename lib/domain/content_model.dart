import 'movie_card_model.dart';

export 'package:hw/utilities/logic.dart';

export 'movie_card_constructor.dart' show Lang, ConvertLangToStr;
export 'movie_card_model.dart';

class ContentModel {
  final List<MovieCard>? movies;

  const ContentModel({required this.movies});
}
