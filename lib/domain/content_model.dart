import 'package:equatable/equatable.dart';

import 'recipe_model.dart';

export 'nutrition_recipe.dart' show Nutrient, ConvertNutritionToStr;
export 'recipe_model.dart';

class RecipesContentModel extends Equatable {
  final List<RecipeModel>? yummlyRecipes;

  const RecipesContentModel({required this.yummlyRecipes});

  @override
  List<Object?> get props => [yummlyRecipes ?? 0];
}
