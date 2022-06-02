import 'package:json_annotation/json_annotation.dart';

part 'yummly_json_recipes_dto.g.dart';

///ссылка на api:
///https://rapidapi.com/apidojo/api/yummly2/
///пример json'ки с данными:
///https://yummly2.p.rapidapi.com/feeds/list/?rapidapi-key=2c21aeb330mshe372d92111fe6a9p12086bjsnb7624140804a
///api чисто для тестовых примеров и обучения, много грязи, мешанины, нет эндпоинта
///с запросом конкретного элемента к сожалению, эндпоинт со списком выгружает сразу всю доступную
///информацию. Лучших вариантов по данной тематике(под неё верстка и была задумана),
///не подверженных санкциям, к сожалению, не нашел.
@JsonSerializable()
class ContentDTO {
  @JsonKey(name: 'feed')
  final List<RecipeDataDTO>? recipes;

  ContentDTO({
    this.recipes,
  });

  factory ContentDTO.fromJson(Map<String, dynamic> json) =>
      _$ContentDTOFromJson(json);
}

@JsonSerializable()
class RecipeDataDTO {
  @JsonKey(name: 'display')
  final RecipeGeneralDataDTO? general;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'content')
  final RecipeAdditionDataDTO? additions;

  RecipeDataDTO({
    required this.general,
    required this.type,
    required this.additions,
  });

  factory RecipeDataDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeDataDTOFromJson(json);
}

/// элементы наименования, имя автора и ссылки на источник
@JsonSerializable()
class RecipeGeneralDataDTO {
  @JsonKey(
    name: 'displayName',
    defaultValue: '',
  )
  final String? title;

  @JsonKey(name: 'images', defaultValue: [])
  final List<String>? reserveImageLink;

  @JsonKey(name: 'source')
  final RecipeSourceDTO? source;

  const RecipeGeneralDataDTO({
    required this.title,
    required this.reserveImageLink,
    this.source,
  });

  factory RecipeGeneralDataDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeGeneralDataDTOFromJson(json);
}

@JsonSerializable()
class RecipeSourceDTO {
  @JsonKey(name: 'sourceSiteUrl')
  final String? authorLink;

  @JsonKey(name: 'sourceRecipeUrl')
  final String? sourceRecipeLink;

  @JsonKey(name: 'sourceDisplayName')
  final String? authorName;

  RecipeSourceDTO({
    this.authorName,
    this.authorLink,
    this.sourceRecipeLink,
  });

  factory RecipeSourceDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeSourceDTOFromJson(json);
}

///Куча всего дополнительного
@JsonSerializable()
class RecipeAdditionDataDTO {
  @JsonKey(name: 'description')
  final RecipeDescriptionDTO? description;

  //Вариант ручками
  // @JsonKey(name: 'tags', readValue: getListTags)
  // final List<RecipeTagDTO>? tags;
  @JsonKey(name: 'tags')
  final Map<String, List<RecipeTagDTO>>? tags;

  @JsonKey(name: 'details')
  final RecipeAdditionDataDetailDTO? details;

  @JsonKey(name: 'ingredientLines')
  final List<RecipeIngredientsDTO>? ingredients;

  @JsonKey(name: 'reviews')
  final RecipeReviewDTO? reviewRatting;

  @JsonKey(name: 'nutrition')
  final RecipeNutritionDTO? nutrition;

  RecipeAdditionDataDTO(
      {this.description,
      this.tags,
      required this.details,
      this.nutrition,
      this.ingredients,
      this.reviewRatting});

  factory RecipeAdditionDataDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeAdditionDataDTOFromJson(json);

// static Object? getListTags(Map<dynamic, dynamic> inputMap, String tag) {
//   final List<RecipeTagDTO> temp = <RecipeTagDTO>[];
//   for (var oneTypeTagList in inputMap.values) {
//     for (var typedElement in oneTypeTagList) {
//       temp.add(
//         RecipeTagDTO(
//           nameTag: typedElement['display-name'],
//           linkTag: typedElement['tag-url'],
//         ),
//       );
//     }
//   }
//   return temp;
// }
}

@JsonSerializable()
class RecipeDescriptionDTO {
  @JsonKey(name: 'text')
  final String? textDesc;

  RecipeDescriptionDTO({this.textDesc});

  factory RecipeDescriptionDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeDescriptionDTOFromJson(json);
}

@JsonSerializable()
class RecipeTagDTO {
  @JsonKey(name: 'display-name')
  final String? nameTag;

  @JsonKey(name: 'tag-url')
  final String? linkTag;

  RecipeTagDTO({this.linkTag, this.nameTag});

  factory RecipeTagDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeTagDTOFromJson(json);
}

@JsonSerializable()
class RecipeAdditionDataDetailDTO {
  @JsonKey(name: 'totalTime')
  final String? totalTime;

  @JsonKey(name: 'images', defaultValue: [])
  final List<RecipeDetailImageLinkDTO>? listImageLinks;

  @JsonKey(name: 'globalId')
  final String? reviewId;

  const RecipeAdditionDataDetailDTO({
    required this.listImageLinks,
    this.totalTime,
    this.reviewId,
  });

  factory RecipeAdditionDataDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeAdditionDataDetailDTOFromJson(json);
}

@JsonSerializable()
class RecipeDetailImageLinkDTO {
  @JsonKey(name: 'resizableImageUrl', defaultValue: '')
  final String? imageLink;

  RecipeDetailImageLinkDTO({required this.imageLink});

  factory RecipeDetailImageLinkDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailImageLinkDTOFromJson(json);
}

@JsonSerializable()
class RecipeNutritionDTO {
  @JsonKey(name: 'nutritionEstimates')
  final List<RecipeNutrientDTO>? nutritionList;

  RecipeNutritionDTO({this.nutritionList});

  factory RecipeNutritionDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeNutritionDTOFromJson(json);
}

@JsonSerializable()
class RecipeNutrientDTO {
  @JsonKey(name: 'attribute')
  final String? codeNutrient;

  @JsonKey(name: 'value')
  final num? quantity;

  @JsonKey(name: 'unit')
  final RecipeNutrientUnitDTO? unit;

  RecipeNutrientDTO({this.codeNutrient, this.quantity, this.unit});

  factory RecipeNutrientDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeNutrientDTOFromJson(json);
}

@JsonSerializable()
class RecipeNutrientUnitDTO {
  @JsonKey(name: 'abbreviation')
  final String? unitName;

  RecipeNutrientUnitDTO({this.unitName});

  factory RecipeNutrientUnitDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeNutrientUnitDTOFromJson(json);
}

@JsonSerializable()
class RecipeIngredientsDTO {
  @JsonKey(name: 'unit')
  final String? unit;

  @JsonKey(name: 'ingredient')
  final String? ingredientName;

  @JsonKey(name: 'remainder')
  final String? clarification;

  @JsonKey(name: 'quantity')
  final num? quantity;

  RecipeIngredientsDTO(
      {this.ingredientName, this.unit, this.quantity, this.clarification});

  factory RecipeIngredientsDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientsDTOFromJson(json);
}

@JsonSerializable()
class RecipeReviewDTO {
  @JsonKey(name: 'averageRating')
  final double? rating;

  RecipeReviewDTO({this.rating});

  factory RecipeReviewDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeReviewDTOFromJson(json);
}
