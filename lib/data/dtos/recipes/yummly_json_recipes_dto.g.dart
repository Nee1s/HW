// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yummly_json_recipes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentDTO _$ContentDTOFromJson(Map<String, dynamic> json) => ContentDTO(
      recipes: (json['feed'] as List<dynamic>?)
          ?.map((e) => RecipeDataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentDTOToJson(ContentDTO instance) =>
    <String, dynamic>{
      'feed': instance.recipes,
    };

RecipeDataDTO _$RecipeDataDTOFromJson(Map<String, dynamic> json) =>
    RecipeDataDTO(
      general: json['display'] == null
          ? null
          : RecipeGeneralDataDTO.fromJson(
              json['display'] as Map<String, dynamic>),
      type: json['type'] as String?,
      additions: json['content'] == null
          ? null
          : RecipeAdditionDataDTO.fromJson(
              json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeDataDTOToJson(RecipeDataDTO instance) =>
    <String, dynamic>{
      'display': instance.general,
      'type': instance.type,
      'content': instance.additions,
    };

RecipeGeneralDataDTO _$RecipeGeneralDataDTOFromJson(
        Map<String, dynamic> json) =>
    RecipeGeneralDataDTO(
      title: json['displayName'] as String? ?? '',
      reserveImageLink: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      source: json['source'] == null
          ? null
          : RecipeSourceDTO.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeGeneralDataDTOToJson(
        RecipeGeneralDataDTO instance) =>
    <String, dynamic>{
      'displayName': instance.title,
      'images': instance.reserveImageLink,
      'source': instance.source,
    };

RecipeSourceDTO _$RecipeSourceDTOFromJson(Map<String, dynamic> json) =>
    RecipeSourceDTO(
      authorName: json['sourceDisplayName'] as String?,
      authorLink: json['sourceSiteUrl'] as String?,
      sourceRecipeLink: json['sourceRecipeUrl'] as String?,
    );

Map<String, dynamic> _$RecipeSourceDTOToJson(RecipeSourceDTO instance) =>
    <String, dynamic>{
      'sourceSiteUrl': instance.authorLink,
      'sourceRecipeUrl': instance.sourceRecipeLink,
      'sourceDisplayName': instance.authorName,
    };

RecipeAdditionDataDTO _$RecipeAdditionDataDTOFromJson(
        Map<String, dynamic> json) =>
    RecipeAdditionDataDTO(
      description: json['description'] == null
          ? null
          : RecipeDescriptionDTO.fromJson(
              json['description'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => RecipeTagDTO.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      details: json['details'] == null
          ? null
          : RecipeAdditionDataDetailDTO.fromJson(
              json['details'] as Map<String, dynamic>),
      nutrition: json['nutrition'] == null
          ? null
          : RecipeNutritionDTO.fromJson(
              json['nutrition'] as Map<String, dynamic>),
      ingredients: (json['ingredientLines'] as List<dynamic>?)
          ?.map((e) => RecipeIngredientsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewRatting: json['reviews'] == null
          ? null
          : RecipeReviewDTO.fromJson(json['reviews'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeAdditionDataDTOToJson(
        RecipeAdditionDataDTO instance) =>
    <String, dynamic>{
      'description': instance.description,
      'tags': instance.tags,
      'details': instance.details,
      'ingredientLines': instance.ingredients,
      'reviews': instance.reviewRatting,
      'nutrition': instance.nutrition,
    };

RecipeDescriptionDTO _$RecipeDescriptionDTOFromJson(
        Map<String, dynamic> json) =>
    RecipeDescriptionDTO(
      textDesc: json['text'] as String?,
    );

Map<String, dynamic> _$RecipeDescriptionDTOToJson(
        RecipeDescriptionDTO instance) =>
    <String, dynamic>{
      'text': instance.textDesc,
    };

RecipeTagDTO _$RecipeTagDTOFromJson(Map<String, dynamic> json) => RecipeTagDTO(
      linkTag: json['tag-url'] as String?,
      nameTag: json['display-name'] as String?,
    );

Map<String, dynamic> _$RecipeTagDTOToJson(RecipeTagDTO instance) =>
    <String, dynamic>{
      'display-name': instance.nameTag,
      'tag-url': instance.linkTag,
    };

RecipeAdditionDataDetailDTO _$RecipeAdditionDataDetailDTOFromJson(
        Map<String, dynamic> json) =>
    RecipeAdditionDataDetailDTO(
      listImageLinks: (json['images'] as List<dynamic>?)
              ?.map((e) =>
                  RecipeDetailImageLinkDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalTime: json['totalTime'] as String?,
      reviewId: json['globalId'] as String?,
    );

Map<String, dynamic> _$RecipeAdditionDataDetailDTOToJson(
        RecipeAdditionDataDetailDTO instance) =>
    <String, dynamic>{
      'totalTime': instance.totalTime,
      'images': instance.listImageLinks,
      'globalId': instance.reviewId,
    };

RecipeDetailImageLinkDTO _$RecipeDetailImageLinkDTOFromJson(
        Map<String, dynamic> json) =>
    RecipeDetailImageLinkDTO(
      imageLink: json['resizableImageUrl'] as String? ?? '',
    );

Map<String, dynamic> _$RecipeDetailImageLinkDTOToJson(
        RecipeDetailImageLinkDTO instance) =>
    <String, dynamic>{
      'resizableImageUrl': instance.imageLink,
    };

RecipeNutritionDTO _$RecipeNutritionDTOFromJson(Map<String, dynamic> json) =>
    RecipeNutritionDTO(
      nutritionList: (json['nutritionEstimates'] as List<dynamic>?)
          ?.map((e) => RecipeNutrientDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeNutritionDTOToJson(RecipeNutritionDTO instance) =>
    <String, dynamic>{
      'nutritionEstimates': instance.nutritionList,
    };

RecipeNutrientDTO _$RecipeNutrientDTOFromJson(Map<String, dynamic> json) =>
    RecipeNutrientDTO(
      codeNutrient: json['attribute'] as String?,
      quantity: json['value'] as num?,
      unit: json['unit'] == null
          ? null
          : RecipeNutrientUnitDTO.fromJson(
              json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeNutrientDTOToJson(RecipeNutrientDTO instance) =>
    <String, dynamic>{
      'attribute': instance.codeNutrient,
      'value': instance.quantity,
      'unit': instance.unit,
    };

RecipeNutrientUnitDTO _$RecipeNutrientUnitDTOFromJson(
        Map<String, dynamic> json) =>
    RecipeNutrientUnitDTO(
      unitName: json['abbreviation'] as String?,
    );

Map<String, dynamic> _$RecipeNutrientUnitDTOToJson(
        RecipeNutrientUnitDTO instance) =>
    <String, dynamic>{
      'abbreviation': instance.unitName,
    };

RecipeIngredientsDTO _$RecipeIngredientsDTOFromJson(
        Map<String, dynamic> json) =>
    RecipeIngredientsDTO(
      ingredientName: json['ingredient'] as String?,
      unit: json['unit'] as String?,
      quantity: json['quantity'] as num?,
      clarification: json['remainder'] as String?,
    );

Map<String, dynamic> _$RecipeIngredientsDTOToJson(
        RecipeIngredientsDTO instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'ingredient': instance.ingredientName,
      'remainder': instance.clarification,
      'quantity': instance.quantity,
    };

RecipeReviewDTO _$RecipeReviewDTOFromJson(Map<String, dynamic> json) =>
    RecipeReviewDTO(
      rating: (json['averageRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RecipeReviewDTOToJson(RecipeReviewDTO instance) =>
    <String, dynamic>{
      'averageRating': instance.rating,
    };
