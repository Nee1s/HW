import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/data/repositories/recipes/yummly_recipes_repository.dart';

import 'event.dart';
import 'state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'event.dart';
export 'state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final RecipesRepository recipesRepository;

  RootBloc(this.recipesRepository) : super(const RootState()) {
    on<FilterMovieEvent>(_onFilterListMovies);
    on<PreloadDataEvent>(_onPreloadingData);
  }

  void _onFilterListMovies(FilterMovieEvent event, Emitter<RootState> emit) {
    emit(
      state.copyWith(
        newData: null,
      ),
    );
  }

  void _onPreloadingData(PreloadDataEvent event, Emitter<RootState> emit) {
    emit(state.copyWith(
        newData: recipesRepository.loadData(start: 0, count: 5)));
  }
}
