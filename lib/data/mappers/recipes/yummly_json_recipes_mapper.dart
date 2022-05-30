import 'package:hw/data/dtos/recipes/yummly_json_recipes_dto.dart';
import 'package:hw/domain/content_model.dart';

extension ContentDTOToDomain on ContentDTO {
  RecipesContentModel toDomain() {
    final List<RecipeModel>? tempListRec;

    if (recipes?.isNotEmpty ?? false) {
      tempListRec = <RecipeModel>[];
      for (var oneRecipe in recipes!) {
        ((oneRecipe.type ?? '') == 'single recipe')
            ? tempListRec.add(oneRecipe._toDomain())
            : null;
      }
    } else {
      tempListRec = null;
    }

    return RecipesContentModel(yummlyRecipes: tempListRec);
  }
}

extension _RecipeDataDTOToDomain on RecipeDataDTO {
  RecipeModel _toDomain() {
    return RecipeModel(
      title: general?.title ?? '',
      imageLink: _saveGetImageLink,
      rating: double.parse(
          additions?.reviewRatting?.rating?.toStringAsFixed(1) ?? '0.0'),
      description: additions?.description?.textDesc,
      totalTime: additions?.details?.totalTime,
      reviewId: additions?.details?.reviewId ?? '',
      authorLink: general?.source?.authorLink,
      authorName: general?.source?.authorName,
      sourceRecipeLink: general?.source?.sourceRecipeLink,
      recTags: _assembleListTags,
      recNutrition: _createListNutrition,
      recIngredients: _createListIngredients,
    );
  }

  ///Иногда тренарный оператор зло - читабельность страдает
  String get _saveGetImageLink {
    return (additions?.details?.listImageLinks?.first.imageLink?.isNotEmpty ??
            false)
        ? additions!.details!.listImageLinks!.first.imageLink!
        : (general?.reserveImageLink?.isNotEmpty ?? false)
            ? general!.reserveImageLink!.first
            : '';
  }

  List<SearchTag> get _assembleListTags {
    final List<SearchTag> tempList;
    if (additions?.tags?.isNotEmpty ?? false) {
      tempList = <SearchTag>[];

      ///Можно с сахарком через additions!.tags!.entries.map((e) => null)
      ///но лучше не надо
      for (var mapTagsKey in additions!.tags!.keys) {
        ///Теги с алергией и диетой отключены в api, увы, по ним пустой список выдает
        if (mapTagsKey.contains('diet') || mapTagsKey.contains('allergy')) {
          continue;
        }

        for (var tagDTO in additions!.tags![mapTagsKey] ?? []) {
          tempList.add(SearchTag(
              nameTag: tagDTO.nameTag ?? '', link: tagDTO.linkTag ?? ''));
        }
      }
    } else {
      tempList = <SearchTag>[];
    }
    return tempList;
  }

  List<Ingredient> get _createListIngredients {
    final List<Ingredient> tempList;
    final Set<String> alreadyExistsIngredients = <String>{};
    if (additions?.ingredients?.isNotEmpty ?? false) {
      tempList = <Ingredient>[];
      for (var ingredientDTO in additions!.ingredients!) {
        if (alreadyExistsIngredients
                .contains(ingredientDTO.ingredientName ?? '') ||
            (ingredientDTO.ingredientName ?? '').isEmpty) {
          continue;
        } else {
          alreadyExistsIngredients.add(ingredientDTO.ingredientName!);
          tempList.add(
            Ingredient(
              name: ingredientDTO.ingredientName!,
              quantity: ingredientDTO.quantity?.toDouble(),
              unit: ingredientDTO.unit,
              clarification: ingredientDTO.clarification,
            ),
          );
        }
      }
    } else {
      tempList = <Ingredient>[];
    }
    return tempList;
  }

  List<Nutrient> get _createListNutrition {
    final List<Nutrient> tempList;
    if (additions?.nutrition?.nutritionList?.isNotEmpty ?? false) {
      tempList = <Nutrient>[];
      for (var nutrientDTO in additions!.nutrition!.nutritionList!) {
        !(nutrientDTO.quantity?.isNaN ?? false) &&
                (_createFromStr(nutrientDTO.codeNutrient ?? '') !=
                    FoodElement.err)
            ? tempList.add(
                Nutrient(
                  element: _createFromStr(nutrientDTO.codeNutrient ?? ''),
                  quantity: nutrientDTO.quantity?.toDouble() ?? 0.0,
                  unitAbbreviation: nutrientDTO.unit?.unitName ?? '',
                ),
              )
            : null;
      }
    } else {
      tempList = <Nutrient>[];
    }
    return tempList;
  }

  FoodElement _createFromStr(String code) {
    switch (code) {
      case 'K':
        return FoodElement.k;
      case 'NA':
        return FoodElement.na;
      case 'CHOLE':
        return FoodElement.chol;
      case 'FATRN':
        return FoodElement.fatrn;
      case 'FASAT':
        return FoodElement.fasat;
      case 'CHOCDF':
        return FoodElement.carb;
      case 'FIBTG':
        return FoodElement.fiber;
      case 'PROCNT':
        return FoodElement.prot;
      case 'VITC':
        return FoodElement.vitC;
      case 'CA':
        return FoodElement.ca;
      case 'FE':
        return FoodElement.fe;
      case 'SUGAR':
        return FoodElement.sugar;
      case 'ENERC_KCAL':
        return FoodElement.enrgKcal;
      case 'FAT':
        return FoodElement.fat;
      case 'VITA_IU':
        return FoodElement.vitA;
      default:
        return FoodElement.err;
    }
  }
}
