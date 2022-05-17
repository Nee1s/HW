import 'package:hw/domain/content_model.dart';

List<MovieModel> filterPicturedListMovie(final List<MovieModel> takenList) {
  return takenList.where((movie) => movie.picture.isNotEmpty).toList();
}

List<MovieModel> filterLangEnumListMovie(
    final List<MovieModel> takenList, Lang filterLang) {
  return takenList.where((movie) => movie.speech == filterLang).toList();
}
