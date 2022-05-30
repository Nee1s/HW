import 'package:hw/data/db/database.dart';
import 'package:hw/domain/content_model.dart';

extension RecipeModelToDatabase on RecipeModel {
  RecipesTableData toDatabase() {
    return RecipesTableData(
      globalId: reviewId,
      title: title,
      imageLink: imageLink,
      authorName: authorName,
      authorLink: authorLink,
      sourceRecipeLink: sourceRecipeLink,
      description: description,
      totalTime: totalTime,
      rating: rating,
    );
  }

  // List<TagsTableData> listTagsToDatabase() {
  //   return List.generate(
  //     tags.length,
  //     (index) => TagsTableData(
  //       nameTag: tags[index].nameTag,
  //       searchId: tags[index].link,
  //       idRecipe: reviewId,
  //     ),
  //   );
  // }
  //
  // List<IngredientsTableData> listIngredientsToDatabase() {
  //   return List.generate(
  //     ingredients.length,
  //     (index) => IngredientsTableData(
  //       name: ingredients[index].name,
  //       quantity: ingredients[index].quantity,
  //       unit: ingredients[index].unit,
  //       clarification: ingredients[index].clarification,
  //       idRecipe: reviewId,
  //     ),
  //   );
  // }
  //
  // List<NutritionTableData> listNutrientToDatabase() {
  //   return List.generate(
  //     nutrition.length,
  //     (index) => NutritionTableData(
  //       element: nutrition[index].element._toDBString(),
  //       quantity: nutrition[index].quantity,
  //       unitAbbreviation: nutrition[index].unitAbbreviation,
  //       idRecipe: reviewId,
  //     ),
  //   );
  // }
}

extension RecipeModelFromDatabase on RecipesTableData {
  ///Списки ингридиентов, питательности и тегов не грузим,
  ///связи еще не трогал
  RecipeModel toDomain() {
    return RecipeModel(
      reviewId: globalId,
      title: title,
      imageLink: imageLink,
      authorName: authorName,
      authorLink: authorLink,
      sourceRecipeLink: sourceRecipeLink,
      description: description,
      totalTime: totalTime,
      rating: rating,
    );
  }
}

// extension TagsFromDatabase on TagsTableData {
//   SearchTag toDomain() {
//     return SearchTag(
//       nameTag: nameTag,
//       link: searchId,
//     );
//   }
// }
//
// extension IngredientsFromDatabase on IngredientsTableData {
//   Ingredient toDomain() {
//     return Ingredient(
//       name: name,
//       quantity: quantity,
//       unit: unit,
//       clarification: clarification,
//     );
//   }
// }
//
// extension NutritionFromDatabase on NutritionTableData {
//   Nutrient toDomain() {
//     return Nutrient(
//       element: element._toFoodElement(),
//       quantity: quantity,
//       unitAbbreviation: unitAbbreviation,
//     );
//   }
// }

extension _ConvertNutritionToStrDB on FoodElement {
  String _toDBString() {
    switch (this) {
      case FoodElement.k:
        return 'k';
      case FoodElement.na:
        return 'na';
      case FoodElement.chol:
        return 'chole';
      case FoodElement.fatrn:
        return 'transfats';
      case FoodElement.fasat:
        return 'satfats';
      case FoodElement.carb:
        return 'carb';
      case FoodElement.fiber:
        return 'fiber';
      case FoodElement.prot:
        return 'prot';
      case FoodElement.vitC:
        return 'vit_c';
      case FoodElement.ca:
        return 'ca';
      case FoodElement.fe:
        return 'fe';
      case FoodElement.sugar:
        return 'sugar';
      case FoodElement.enrgKcal:
        return 'enrg';
      case FoodElement.fat:
        return 'fats';
      case FoodElement.vitA:
        return 'vit_a';
      default:
        return "unkwn";
    }
  }
}

extension _ConvertStrDBToNutrition on String {
  FoodElement _toFoodElement() {
    switch (this) {
      case 'k':
        return FoodElement.k;
      case 'na':
        return FoodElement.na;
      case 'chole':
        return FoodElement.chol;
      case 'transfats':
        return FoodElement.fatrn;
      case 'satfats':
        return FoodElement.fasat;
      case 'carb':
        return FoodElement.carb;
      case 'fiber':
        return FoodElement.fiber;
      case 'prot':
        return FoodElement.prot;
      case 'vit_c':
        return FoodElement.vitC;
      case 'ca':
        return FoodElement.ca;
      case 'fe':
        return FoodElement.fe;
      case 'sugar':
        return FoodElement.sugar;
      case 'enrg':
        return FoodElement.enrgKcal;
      case 'fats':
        return FoodElement.fat;
      case 'vit_a':
        return FoodElement.vitA;
      default:
        return FoodElement.err;
    }
  }
}
