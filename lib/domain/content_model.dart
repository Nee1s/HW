import 'recipe_model.dart';

export 'package:hw/utilities/modify_model.dart';

export 'nutrition_recipe.dart' show Nutrient, ConvertNutritionToStr;
export 'recipe_model.dart';

class MovieContentModel {
  final List<RecipeModel> yummlyRecipes;

  const MovieContentModel({required this.yummlyRecipes});
}
