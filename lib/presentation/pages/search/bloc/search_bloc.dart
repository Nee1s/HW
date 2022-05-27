import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_bloc_event.dart';
import 'search_bloc_state.dart';

export 'search_bloc_event.dart';
export 'search_bloc_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<RepaintFilterEvent>(_repaintingFilter);
  }

  void _repaintingFilter(RepaintFilterEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(
      radioBLang: event.filterLang,
      chkBxPoster: event.filterWithPoster,
    ));
  }
}
