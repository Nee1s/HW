import 'package:equatable/equatable.dart';
import 'package:hw/domain/content_model.dart';

class RootState extends Equatable {
  //позже список переедет в свернутый класс 'всей' модели
  //vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  final List<MovieCard>? dataMovies;

  final Lang? radioBLang;
  final bool? chkBxPoster;
  final String? search;

  const RootState({
    this.dataMovies,
    this.radioBLang = Lang.err,
    this.chkBxPoster = false,
    this.search = '',
  });

  RootState copyWith({
    List<MovieCard>? dataMovies,
    Lang? radioBLang,
    bool? chkBxPoster,
    String? search,
  }) =>
      RootState(
        dataMovies: dataMovies ?? this.dataMovies,
        radioBLang: radioBLang ?? this.radioBLang,
        chkBxPoster: chkBxPoster ?? this.chkBxPoster,
        search: search ?? this.search,
      );

  @override
  List<Object?> get props =>
      [dataMovies ?? 0, radioBLang ?? 0, chkBxPoster ?? 0, search ?? 0];
}
