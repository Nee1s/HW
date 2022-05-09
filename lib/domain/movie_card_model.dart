import 'package:hw/domain/content_model.dart';

import 'movie_card_constructor.dart';

class MovieCard extends Film with MixinLanguage {
  final String country;

  const MovieCard({
    String id = "0",
    String title = "something_gonna_wrong",
    String picture = "",
    double voteAverage = 5.0,
    String releaseDate = "xxxx",
    String description = "Какое-то описание",
    String language = "Русский",
    Lang speech = Lang.rus,
    this.country = "Россия",
  }) : super(
          id: id,
          title: title,
          picture: picture,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          description: description,
          language: language,
          speech: speech,
        );
}
