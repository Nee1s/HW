import 'package:hw/domain/content_model.dart';

List<MovieModel> generateListFilms() {
  //await Future.delayed(const Duration(seconds: 1));
  return const <MovieModel>[
    MovieModel(
      id: "1",
      title: "Красота внутри",
      voteAverage: 7.7,
      language: "Корейское озвучивание",
      speech: Lang.kor,
      country: "Корея",
      releaseDate: "2015",
      picture: "assets/images/byuti_insaideu.jpg",
    ),
    MovieModel(
      id: "2",
      title: "Пункт назначения 4",
      voteAverage: 5.7,
      language: "Английское озвучивание",
      speech: Lang.eng,
      country: "США",
      releaseDate: "2009",
      picture: "assets/images/the_final_destination.jpg",
    ),
    MovieModel(
      id: "3",
      title: "Вокруг света за 80 дней",
      voteAverage: 7.8,
      language: "Английское озвучивание",
      speech: Lang.eng,
      country: "США",
      releaseDate: "2004",
      picture: '',
    ),
    MovieModel(
      id: "4",
      title: "Клыки ночи",
      voteAverage: 5.7,
      language: "Английское озвучивание",
      speech: Lang.eng,
      country: "Великобритания",
      releaseDate: "2021",
      picture: "assets/images/night_teeth.jpg",
    ),
    MovieModel(
      id: "5",
      title: "Мой шпион",
      voteAverage: 6.4,
      language: "Русское озвучивание",
      speech: Lang.rus,
      country: "США",
      releaseDate: "2020",
      picture: "assets/images/my_spy.jpg",
    ),
    MovieModel(
      id: "6",
      title: "Шан-Чи. легенда десяти колец",
      voteAverage: 7.3,
      language: "Русское озвучивание",
      speech: Lang.rus,
      country: "США",
      releaseDate: "2021",
      picture: "assets/images/shang-chi.jpg",
    ),
    MovieModel(
      id: "7",
      title: "Город героев",
      voteAverage: 7.9,
      language: "Японское озвучивание",
      speech: Lang.jpn,
      country: "Япония",
      releaseDate: "2014",
      picture: "assets/images/big_hero_6.jpg",
    ),
  ];
}

List<MovieModel> filterTitleListMovie(
        final List<MovieModel> takenList, String title) =>
    takenList.where((movie) => movie.title.contains(title)).toList();

List<MovieModel> filterDateListMovie(
    final List<MovieModel> takenList, int askDate,
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

List<MovieModel> filterVoteListMovie(
    final List<MovieModel> takenList, double vote,
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

List<MovieModel> filterPicturedListMovie(final List<MovieModel> takenList) {
  return takenList.where((movie) => movie.picture.isNotEmpty).toList();
}

List<MovieModel> filterLangEnumListMovie(
    final List<MovieModel> takenList, Lang filterLang) {
  return takenList.where((movie) => movie.speech == filterLang).toList();
}
