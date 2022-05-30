import 'package:equatable/equatable.dart';
import 'package:hw/domain/content_model.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object?> get props => [];
}

class PreloadDataEvent extends RootEvent {
  const PreloadDataEvent();

  @override
  List<Object?> get props => [];
}

class SearchDataEvent extends RootEvent {
  const SearchDataEvent({required this.search});

  final String? search;

  @override
  List<Object?> get props => [search ?? 0];
}

class DBRecipesIsChangedEvent extends RootEvent {
  const DBRecipesIsChangedEvent({required this.newList});

  final List<RecipeModel>? newList;

  @override
  List<Object?> get props => [newList ?? 0];
}

class SavingRecipeIsClickedEvent extends RootEvent {
  const SavingRecipeIsClickedEvent({this.clickedRecipe});

  final RecipeModel? clickedRecipe;

  @override
  List<Object?> get props => [clickedRecipe ?? 0];
}
