import 'package:equatable/equatable.dart';
import 'package:hw/domain/content_model.dart';

class RootState extends Equatable {
  final Future<RecipesContentModel?>? dataRecipes;

  ///надо было подумать - возможно стоит обернуть как и основные данные
  final List<RecipeModel>? savedRecipes;

  const RootState({
    this.savedRecipes,
    this.dataRecipes,
  });

  RootState copyWith({
    Future<RecipesContentModel?>? newData,
    List<RecipeModel>? newSavedList,
  }) =>
      RootState(
        dataRecipes: newData ?? dataRecipes,
        savedRecipes: newSavedList ?? [],
      );

  @override
  List<Object?> get props => [
        dataRecipes ?? 0,
        savedRecipes ?? 0,
      ];
}
