import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/domain/content_model.dart';

import 'event.dart';
import 'state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'event.dart';
export 'state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final MovieContentModel movies =
      MovieContentModel(localMovies: generateListFilms());

  RootBloc() : super(const RootState()) {
    on<FilterMovieEvent>(_onFilteringListMovies);
    on<PreloadDataEvent>(_onPreloadingData);
  }

  MovieContentModel? get dataMovies {
    return state.dataMovies ?? movies;
  }

  void _onFilteringListMovies(FilterMovieEvent event, Emitter<RootState> emit) {
    List<MovieModel> filteringMovies = List.from(movies.localMovies);
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
    emit(
      state.copyWith(
        dataMovies: MovieContentModel(localMovies: filteringMovies),
      ),
    );
  }

  void _onPreloadingData(PreloadDataEvent event, Emitter<RootState> emit) {
    emit(state.copyWith(
      dataMovies: movies,
      radioBLang: Lang.err,
      chkBxPoster: false,
      search: '',
    ));
  }
}
