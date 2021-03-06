import 'ingredient_recipe.dart';
import 'nutrition_recipe.dart';
import 'parts_recipe.dart';

export 'ingredient_recipe.dart';
export 'nutrition_recipe.dart';
export 'parts_recipe.dart';

class RecipeModel {
  final String title;
  final String imageLink;
  final String? authorLink;
  final String? sourceRecipeLink;
  final String? authorName;
  final String? description;
  late final List<SearchTag> _tags;
  final String? totalTime;
  final double? rating;
  final String? reviewId;
  late final List<Ingredient> _ingredients;
  late final List<Nutrient> _nutrition;

  RecipeModel({
    required this.title,
    required this.imageLink,
    this.rating,
    this.description,
    this.totalTime,
    this.reviewId,
    this.authorLink,
    this.authorName,
    this.sourceRecipeLink,
    List<SearchTag> recTags = const <SearchTag>[],
    List<Nutrient> recNutrition = const <Nutrient>[],
    List<Ingredient> recIngredients = const <Ingredient>[],
  }) {
    _ingredients = recIngredients;
    _nutrition = recNutrition;
    _tags = recTags;
  }

  ///На всякий, менять сам не собираюсь, но возможно что-то считать придется
  List<Ingredient> get ingredients => List.unmodifiable(_ingredients);

  List<Nutrient> get nutrition => List.unmodifiable(_nutrition);

  List<SearchTag> get tags => List.unmodifiable(_tags);
}
