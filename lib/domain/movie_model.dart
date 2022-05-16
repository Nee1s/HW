import 'movie_model_constructor.dart';

class MovieModel extends Film {
  final String country;

  const MovieModel({
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
