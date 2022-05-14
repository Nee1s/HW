import 'movie_card_constructor.dart';

class MovieCard extends Film with MixinLanguage {
  final String country;

  MovieCard({
    String id = "0",
    String title = "something_gonna_wrong",
    String picture = "",
    double voteAverage = 5.0,
    String releaseDate = "xxxx",
    String description = "Какое-то описание",
    String language = "Русский",
    this.country = "Россия",
  }) : super(
          id: id,
          title: title,
          picture: picture,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          description: description,
          language: language,
        ) {
    convertLang(language);
  }
}
