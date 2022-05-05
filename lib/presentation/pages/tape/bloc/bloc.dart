import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/domain/content_model.dart';
import 'package:hw/presentation/pages/tape/bloc/event.dart';
import 'package:hw/presentation/pages/tape/bloc/state.dart';

export 'package:hw/presentation/pages/tape/bloc/event.dart';
export 'package:hw/presentation/pages/tape/bloc/state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final List<MovieCard> listMovies = generateListFilms();

  RootBloc() : super(const RootState()) {
    on<FilterMovieEvent>(_onFilteringListMovies);
    on<PreloadDataEvent>(_onPreloadingData);
    on<PaintFilterFieldEvent>(_onPaintFilterField);
  }

  List<MovieCard?>? get dataMovies {
    return state.dataMovies ?? listMovies;
  }

  void _onFilteringListMovies(FilterMovieEvent event, Emitter<RootState> emit) {
    List<MovieCard> filteringMovies = List.from(listMovies);
    event.search?.isNotEmpty ?? false
        ? filteringMovies = filterTitleListMovie(filteringMovies, event.search!)
        : null;
    event.filterLang != null && event.filterLang != Lang.err
        ? filteringMovies =
            filterLangEnumListMovie(filteringMovies, event.filterLang!)
        : null;
    event.filterWithPoster ?? false
        ? filteringMovies = filterPicturedListMovie(filteringMovies)
        : null;
    emit(state.copyWith(dataMovies: filteringMovies));
  }

  void _onPreloadingData(PreloadDataEvent event, Emitter<RootState> emit) {
    emit(state.copyWith(
      dataMovies: listMovies,
      radioBLang: Lang.err,
      chkBxPoster: false,
      search: '',
    ));
  }

  void _onPaintFilterField(
      PaintFilterFieldEvent event, Emitter<RootState> emit) {
    emit(state.copyWith(
        radioBLang: event.radioBtnLang, chkBxPoster: event.checkBxWithPoster));
  }
}
