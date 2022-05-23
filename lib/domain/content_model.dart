import 'recipe_model.dart';

export 'nutrition_recipe.dart' show Nutrient, ConvertNutritionToStr;
export 'recipe_model.dart';

class RecipesContentModel {
  final List<RecipeModel>? yummlyRecipes;

  const RecipesContentModel({required this.yummlyRecipes});
}
