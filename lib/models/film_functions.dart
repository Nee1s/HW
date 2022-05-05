import 'dart:async';

import 'package:hw/models/film_card.dart';

Future<List<Movie>> generateListFilms() async {
  List<Movie> tmpListFilms = [];
  tmpListFilms.add(Movie(
    id: "1",
    title: "Красота внутри",
    voteAverage: 7.7,
    language: "Корейский",
    country: "Корея",
    releaseDate: "2015",
    picture: "assets/byuti_insaideu.jpg",
  ));
  tmpListFilms.add(Movie(
    id: "2",
    title: "Пункт назначения 4",
    voteAverage: 5.7,
    language: "Английский",
    country: "США",
    releaseDate: "2009",
    picture: "assets/the_final_destination.jpg",
  ));
  tmpListFilms.add(Movie(
    id: "3",
    title: "Вокруг света за 80 дней",
    voteAverage: 7.8,
    language: "Английский",
    country: "США",
    releaseDate: "2004",
    picture: "assets/around_the_world_in_80_days.jpg",
  ));
  tmpListFilms.add(Movie(
    id: "4",
    title: "Клыки ночи",
    voteAverage: 5.7,
    language: "Английский",
    country: "Великобритания",
    releaseDate: "2021",
    picture: "assets/night_teeth.jpg",
  ));
  tmpListFilms.add(Movie(
    id: "5",
    title: "Мой шпион",
    voteAverage: 6.4,
    language: "Русский",
    country: "США",
    releaseDate: "2020",
    picture: "assets/my_spy.jpg",
  ));
  tmpListFilms.add(Movie(
    id: "6",
    title: "Шан-Чи и легенда десяти колец",
    voteAverage: 7.3,
    language: "Русский",
    country: "США",
    releaseDate: "2021",
    picture: "assets/shang-chi.jpg",
  ));
  tmpListFilms.add(Movie(
    id: "7",
    title: "Город героев",
    voteAverage: 7.9,
    language: "Японский",
    country: "Япония",
    releaseDate: "2014",
    picture: "assets/big_hero_6.jpg",
  ));

  return tmpListFilms;
}

// void printDone() async {
//   List<Movie> printingList = await generateListFilms();
//
//   printingList.forEach((movie) => print(movie.title));
// }

Stream<Movie> createMovies(int countObj) async* {
  const List<String> _namesList = [
    "Красота внутри",
    "Пункт назначения 4",
    "Вокруг света за 80 дней",
    "Клыки ночи",
    "Мой шпион",
    "Шан-Чи и легенда десяти колец",
    "Город героев",
  ];
  const List<double> _voteAverageList = [
    7.7,
    5.7,
    7.8,
    5.7,
    6.4,
    7.3,
    7.9,
  ];
  const List<String> _languageList = [
    "Корейский",
    "Английский",
    "Английский",
    "Английский",
    "Русский",
    "Русский",
    "Японский",
  ];
  const List<String> _countryList = [
    "Корея",
    "США",
    "США",
    "Великобритания",
    "США",
    "США",
    "Япония"
  ];
  const List<String> _releaseDateList = [
    "2015",
    "2009",
    "2004",
    "2021",
    "2020",
    "2021",
    "2014",
  ];
  const List<String> _pictureList = [
    "assets/byuti_insaideu.jpg",
    "assets/the_final_destination.jpg",
    "assets/around_the_world_in_80_days.jpg",
    "assets/night_teeth.jpg",
    "assets/my_spy.jpg",
    "assets/shang-chi.jpg",
    "assets/big_hero_6.jpg",
  ];
  for (int id = 0; id < countObj; id++) {
    final Movie tmpObj = Movie(
      id: (id + 1).toString(),
      title: _namesList[id % 7],
      voteAverage: _voteAverageList[id % 7],
      language: _languageList[id % 7],
      country: _countryList[id % 7],
      releaseDate: _releaseDateList[id % 7],
      picture: _pictureList[id % 7],
    );
    yield tmpObj;
  }

  // for
} // Function

List<Movie> formingListMovie() {
  final List<Movie> tmpListFilms = [];
  createMovies(7).listen((newFilm) {
    tmpListFilms.add(newFilm);
  }).onDone(() {});
  return tmpListFilms;
} //Function

List<Movie> filterTitleListMovie(final List<Movie> takenList, String title) {
  List<Movie> tempList = List.from(takenList);
  tempList.removeWhere((movie) => !movie.title.contains(title));
  return tempList;
}

List<Movie> filterDateListMovie(final List<Movie> takenList, int askDate,
    {bool? isOver}) {
  List<Movie> tempList = List.from(takenList);
  switch (isOver) {
    case true:
      tempList.removeWhere((movie) => int.parse(movie.releaseDate) > askDate);
      return tempList;
    case false:
      tempList.removeWhere((movie) => int.parse(movie.releaseDate) < askDate);
      return tempList;
    default:
      tempList.removeWhere((movie) => int.parse(movie.releaseDate) == askDate);
      return tempList;
  }
}

List<Movie> filterVoteListMovie(final List<Movie> takenList, double vote,
    {bool? isOver}) {
  List<Movie> tempList = List.from(takenList);
  switch (isOver) {
    case true:
      tempList.removeWhere((movie) => movie.voteAverage > vote);
      return tempList;
    case false:
      tempList.removeWhere((movie) => movie.voteAverage < vote);
      return tempList;
    default:
      tempList.removeWhere((movie) => movie.voteAverage == vote);
      return tempList;
  }
}

List<Movie> filterPicturedListMovie(
    final List<Movie> takenList, bool needPicture) {
  List<Movie> tempList = List.from(takenList);
  needPicture
      ? tempList.removeWhere((movie) => movie.picture.isNotEmpty)
      : tempList.removeWhere((movie) => movie.picture.isEmpty);
  return tempList;
}
