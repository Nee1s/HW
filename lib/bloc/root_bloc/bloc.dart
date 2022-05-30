import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/data/repositories/recipes/yummly_recipes_repository.dart';
import 'package:hw/domain/content_model.dart';

import 'event.dart';
import 'state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'event.dart';
export 'state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final RecipesRepository _recipesRepository;

  RootBloc(this._recipesRepository) : super(const RootState()) {
    on<SearchDataEvent>(_onSearchData);
    on<PreloadDataEvent>(_onPreloadData);
    on<DBRecipesIsChangedEvent>(_onChangeDBRecipes);
    on<SavingRecipeIsClickedEvent>(_onChangeSavedRecipeByUser);
    _recipesRepository.streamAllRecipes().listen(
      (data) {
        add(DBRecipesIsChangedEvent(newList: data));
      },
    );
  }

  void _onSearchData(SearchDataEvent event, Emitter<RootState> emit) {
    emit(
      state.copyWith(
        newData: _recipesRepository.searchData(
          start: 0,
          count: 10,
          search: event.search ?? '',
        ),
      ),
    );
  }

  void _onPreloadData(PreloadDataEvent event, Emitter<RootState> emit) {
    emit(
      state.copyWith(
        newData: _recipesRepository.loadData(
          start: 0,
          count: 10,
        ),
      ),
    );
  }

  void _onChangeDBRecipes(
      DBRecipesIsChangedEvent event, Emitter<RootState> emit) {
    emit(
      state.copyWith(
        newSavedList: event.newList,
      ),
    );
  }

  void _onChangeSavedRecipeByUser(
      SavingRecipeIsClickedEvent event, Emitter<RootState> emit) async {
    final RecipeModel? involvedRecipe = event.clickedRecipe;
    final List<RecipeModel>? receivedList = state.savedRecipes;

    RecipeModel? checkIsInList = (receivedList?.isNotEmpty ?? false)
        ? receivedList!.firstWhereOrNull(
            (recipe) => recipe.reviewId == involvedRecipe?.reviewId)
        : null;

    if (checkIsInList != null) {
      await _recipesRepository.deleteRecipeFromDB(checkIsInList.reviewId);
    } else if (involvedRecipe != null) {
      await _recipesRepository.insertRecipeToDB(involvedRecipe);
    }
  }
}
