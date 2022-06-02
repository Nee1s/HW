import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/data/repositories/recipes/yummly_recipes_repository.dart';
import 'package:hw/domain/content_model.dart';

import 'event.dart';
import 'state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'event.dart';
export 'state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final RecipesRepository recipesRepository;

  ///Запросы ограничены, воткнул временно заплатку из констаного списка
  ///в готовом задании буду убирать как сейчас
  static const TempLoaderData recipesRepository2 = TempLoaderData();

  RootBloc(this.recipesRepository) : super(const RootState()) {
    on<SearchDataEvent>(_onSearchData);
    on<PreloadDataEvent>(_onPreloadData);
  }

  void _onSearchData(SearchDataEvent event, Emitter<RootState> emit) {
    emit(
      state.copyWith(
        newData: recipesRepository.searchData(
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
        newData: recipesRepository2.loadData(
          start: 0,
          count: 10,
        ),
      ),
    );
  }
}

///Собсна сама заплатка
class TempLoaderData {
  const TempLoaderData();

  Future<RecipesContentModel> loadData({int? start, int? count}) {
    RecipesContentModel temp = RecipesContentModel(
      yummlyRecipes: [
        RecipeModel(
          title: "Bangers and Mash with Onion Gravy",
          imageLink:
              "https://lh3.googleusercontent.com/WqloBRoJAFEgZG4AZMcnNQcEIW2_YMY9YFpCkuGanip-RkbQj3TCAhTAw4v50ODgVdEQLgPcNkSVICk-hQjVBg",
          rating: 3,
          description: "",
          totalTime: "1 hr 25 min",
          reviewId: "0af14110-8327-40da-8204-94fdb4e04dc3",
          authorLink: "http://www.williams-sonoma.com",
          authorName: "Williams-Sonoma",
          sourceRecipeLink: "https://www.williams-son…sh-with-onion-gravy.html",
          recTags: [
            SearchTag(
              nameTag: "English",
              link: "cuisine^cuisine-english",
            ),
            SearchTag(
              nameTag: "Low Sugar",
              link: "nutrition^nutrition-low-sugar",
            ),
            SearchTag(
              nameTag: "High Vitamin C",
              link: "nutrition^nutrition-high-vitamin-c",
            ),
            SearchTag(
              nameTag: "High Protein",
              link: "nutrition^nutrition-high-protein",
            ),
            SearchTag(
              nameTag: "High Potassium",
              link: "nutrition^nutrition-high-potassium",
            ),
            SearchTag(
              nameTag: "High Iron",
              link: "nutrition^nutrition-high-iron",
            ),
            SearchTag(
              nameTag: "High Fiber",
              link: "nutrition^nutrition-high-fiber",
            ),
            SearchTag(
              nameTag: "Baking",
              link: "technique^technique-baking",
            ),
          ],
          recIngredients: [
            Ingredient(
              name: "bangers",
              quantity: 2,
              unit: "pound",
              clarification: "good-quality, or pork sausages",
            ),
            Ingredient(
              name: "sunflower oil",
              quantity: 1,
              unit: "tablespoon",
            ),
            Ingredient(
              name: "yukon gold potatoes",
              quantity: 2,
              unit: "pound",
            ),
            Ingredient(name: "sea salt"),
            Ingredient(name: "freshly ground pepper"),
            Ingredient(
              name: "milk",
              quantity: 0.33,
              unit: "cup",
            ),
            Ingredient(
              name: "unsalted butter",
              quantity: 2,
              unit: "tablespoon",
            ),
            Ingredient(
              name: "olive oil",
              quantity: 1,
              unit: "tablespoon",
            ),
            Ingredient(
              name: "red onions",
              quantity: 2,
              unit: "",
              clarification: "halved and finely sliced",
            ),
            Ingredient(
              name: "all-purpose flour",
              quantity: 1.5,
              unit: "teaspoon",
            ),
            Ingredient(
              name: "red wine vinegar",
              quantity: 1,
              unit: "teaspoon",
            ),
            Ingredient(
              name: "red wine",
              quantity: 1,
              unit: "cup",
              clarification: "full-bodied, such as Shiraz",
            ),
            Ingredient(
              name: "chicken stock",
              quantity: 1,
              unit: "cup",
            ),
          ],
          recNutrition: [
            Nutrient(
              element: FoodElement.k,
              quantity: 1.9,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.fasat,
              quantity: 42.33,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.fe,
              quantity: 0.01,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.sugar,
              quantity: 5.27,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.fiber,
              quantity: 9.28,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.prot,
              quantity: 63.09,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.carb,
              quantity: 41.56,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.chol,
              quantity: 0.27,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.ca,
              quantity: 0.2,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.vitA,
              quantity: 374.8,
              unitAbbreviation: "IU",
            ),
            Nutrient(
              element: FoodElement.fatrn,
              quantity: 4.54,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.enrgKcal,
              quantity: 1537.46,
              unitAbbreviation: "kcal",
            ),
            Nutrient(
              element: FoodElement.vitC,
              quantity: 0.03,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.fat,
              quantity: 119.31,
              unitAbbreviation: "g",
            ),
            Nutrient(
              element: FoodElement.na,
              quantity: 4.27,
              unitAbbreviation: "g",
            ),
          ],
        ),
        RecipeModel(
          title:
              "Wild garlic, tarragon and mint roast chicken with lettuce and peas",
          imageLink:
              "https://lh3.googleusercontent.com/RkpNNZGt-vwzEa8PTP_LwWOfIJMl7VREsiduqgbbK9fAQxnzBcr6RZCAYNhtVACOikFTi_3kWaWrkbSDZgPGIi2oRsssutChHkc",
          rating: 3,
          description:
              "This springtime wild garlic roast chicken makes the most of seasonal spring produce – wild garlic and herbs like tarragon and mint – to flavour the meat. Or, try this similarly herby roast chicken recipe slathered with basil, mint and pistachio pesto.",
          totalTime: "1 hr 35 min",
          reviewId: "49c36b66-053b-4c36-9689-eb05d2192533",
          authorLink: "deliciousmagazine.co.uk",
          authorName: "Delicious Magazine",
          sourceRecipeLink:
              "https://www.deliciousmagazine.co.uk/recipes/wild-garlic-tarragon-and-mint-roast-chicken/",
          recTags: [
            SearchTag(
              nameTag: "Main Dishes",
              link: "course^course-Main Dishes",
            ),
            SearchTag(
              nameTag: "Roast Chicken",
              link: "dish^dish-roast-chicken",
            ),
            SearchTag(
              nameTag: "Roasting",
              link: "technique^technique-roasting",
            ),
            SearchTag(
              nameTag: "Boiling",
              link: "technique^technique-boiling",
            ),
          ],
          recIngredients: [
            Ingredient(
              name: "butter",
              quantity: 60,
              unit: "gram",
              clarification: "softened",
            ),
            Ingredient(
              name: "wild garlic leaves",
              quantity: 0.5,
              unit: "bunch",
              clarification: "finely chopped, see Know-how",
            ),
            Ingredient(
              name: "fresh tarragon",
              quantity: 1,
              unit: "tablespoon",
              clarification: "each, and mint leaves, finely chopped",
            ),
            Ingredient(
              name: "free range chicken",
              quantity: 2,
              unit: "kilogram",
              clarification: "at room temperature",
            ),
            Ingredient(
              name: "potatoes",
              clarification: "Steamed, to serve",
            ),
            Ingredient(
              name: "unsalted butter",
              quantity: 25,
              unit: "gram",
            ),
            Ingredient(
              name: "pickled onions",
              quantity: 340,
              unit: "gram",
              clarification: "jar sweet silverskin, drained",
            ),
            Ingredient(
              name: "vegetable stock",
              quantity: 300,
              unit: "milliliter",
            ),
            Ingredient(
              name: "frozen peas",
              quantity: 400,
              unit: "gram",
            ),
            Ingredient(
              name: "baby gem",
              quantity: 2,
              clarification: "lettuces, sliced",
            ),
            Ingredient(
              name: "crème fraîche",
              quantity: 2,
              unit: "tablespoon",
            ),
            Ingredient(
              name: "mint leaves",
              quantity: 1,
              unit: "handful",
              clarification: "torn",
            ),
          ],
          recNutrition: <Nutrient>[],
        ),
      ],
    );

    return Future(() => temp);
  }
}
