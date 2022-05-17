import 'movie_model_constructor.dart';

class MovieModel {
  final String id;
  final String title;
  final String cookTime;
  final String picture;
  final double voteAverage;
  final String linkSource;
  final String description;

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
