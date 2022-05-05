import 'package:hw/domain/content_model.dart';

List<MovieCard> generateListFilms() {
  //await Future.delayed(const Duration(seconds: 1));
  return <MovieCard>[
    MovieCard(
      id: "1",
      title: "Красота внутри",
      voteAverage: 7.7,
      language: "Корейский",
      country: "Корея",
      releaseDate: "2015",
      picture: "assets/byuti_insaideu.jpg",
    ),
    MovieCard(
      id: "2",
      title: "Пункт назначения 4",
      voteAverage: 5.7,
      language: "Английский",
      country: "США",
      releaseDate: "2009",
      picture: "assets/the_final_destination.jpg",
    ),
    MovieCard(
      id: "3",
      title: "Вокруг света за 80 дней",
      voteAverage: 7.8,
      language: "Английский",
      country: "США",
      releaseDate: "2004",
      picture: '',
    ),
    MovieCard(
      id: "4",
      title: "Клыки ночи",
      voteAverage: 5.7,
      language: "Английский",
      country: "Великобритания",
      releaseDate: "2021",
      picture: "assets/night_teeth.jpg",
    ),
    MovieCard(
      id: "5",
      title: "Мой шпион",
      voteAverage: 6.4,
      language: "Русский",
      country: "США",
      releaseDate: "2020",
      picture: "assets/my_spy.jpg",
    ),
    MovieCard(
      id: "6",
      title: "Шан-Чи и легенда десяти колец",
      voteAverage: 7.3,
      language: "Русский",
      country: "США",
      releaseDate: "2021",
      picture: "assets/shang-chi.jpg",
    ),
    MovieCard(
      id: "7",
      title: "Город героев",
      voteAverage: 7.9,
      language: "Японский",
      country: "Япония",
      releaseDate: "2014",
      picture: "assets/big_hero_6.jpg",
    ),
  ];
}

List<MovieCard> filterTitleListMovie(
        final List<MovieCard> takenList, String title) =>
    takenList.where((movie) => movie.title.contains(title)).toList();

List<MovieCard> filterDateListMovie(
    final List<MovieCard> takenList, int askDate,
    {bool? isOver}) {
  switch (isOver) {
    case true:
      return takenList
          .where((movie) => int.parse(movie.releaseDate) > askDate)
          .toList();
    case false:
      return takenList
          .where((movie) => int.parse(movie.releaseDate) < askDate)
          .toList();
    default:
      return takenList
          .where((movie) => int.parse(movie.releaseDate) == askDate)
          .toList();
  }
}

List<MovieCard> filterVoteListMovie(
    final List<MovieCard> takenList, double vote,
    {bool? isOver}) {
  switch (isOver) {
    case true:
      return takenList.where((movie) => movie.voteAverage > vote).toList();
    case false:
      return takenList.where((movie) => movie.voteAverage < vote).toList();
    default:
      return takenList.where((movie) => movie.voteAverage == vote).toList();
  }
}

List<MovieCard> filterPicturedListMovie(final List<MovieCard> takenList) {
  return takenList.where((movie) => movie.picture.isNotEmpty).toList();
}

List<MovieCard> filterLangEnumListMovie(
    final List<MovieCard> takenList, Lang filterLang) {
  return takenList.where((movie) => movie.speech == filterLang).toList();
}
