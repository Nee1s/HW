import 'package:json_annotation/json_annotation.dart';

part 'yummly_json_category_view.g.dart';

///ссылка на api:
///https://rapidapi.com/apidojo/api/yummly2/
///пример json'ки с данными:
///https://yummly2.p.rapidapi.com/categories/list/?rapidapi-key=2c21aeb330mshe372d92111fe6a9p12086bjsnb7624140804a
///
///Категории рецептов - фильтрация при отображении списков
///(searchId категория и тегов применяются в разных эндопиноинтах)
@JsonSerializable()
class CategoryDTO {
  @JsonKey(name: 'browse-categories')
  final List<CategoryItemsDTO>? categories;

  CategoryDTO({
    required this.categories,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);
}

@JsonSerializable()
class CategoryItemsDTO {
  @JsonKey(name: 'display')
  final HeadCategoryDTO? headCategory;

  CategoryItemsDTO({
    this.headCategory,
  });

  factory CategoryItemsDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemsDTOFromJson(json);
}

@JsonSerializable()
class HeadCategoryDTO {
  @JsonKey(name: 'displayName')
  final String? headCategoryName;

  @JsonKey(name: 'iconImage')
  final String? headCategoryLinkIcon;

  @JsonKey(name: 'categoryImage')
  final String? headCategoryLinkImage;

  @JsonKey(name: 'tag')
  final String? headCategorySearchId;

  @JsonKey(name: 'categoryTopics')
  final List<CategorySubItemsDTO>? listSubCategory;

  HeadCategoryDTO({
    this.headCategoryName,
    this.headCategoryLinkImage,
    this.headCategoryLinkIcon,
    this.headCategorySearchId,
    this.listSubCategory,
  });

  factory HeadCategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$HeadCategoryDTOFromJson(json);
}

@JsonSerializable()
class CategorySubItemsDTO {
  @JsonKey(name: 'display')
  final SubCategoryDTO? subCategoryItems;

  CategorySubItemsDTO({
    this.subCategoryItems,
  });

  factory CategorySubItemsDTO.fromJson(Map<String, dynamic> json) =>
      _$CategorySubItemsDTOFromJson(json);
}

@JsonSerializable()
class SubCategoryDTO {
  @JsonKey(name: 'displayName')
  final String? nameSubCategory;

  @JsonKey(name: 'iconImage')
  final String? subCategoryLinkImage;

  @JsonKey(name: 'tag')
  final String? subCategorySearchId;

  SubCategoryDTO({
    this.nameSubCategory,
    this.subCategoryLinkImage,
    this.subCategorySearchId,
  });

  factory SubCategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryDTOFromJson(json);
}
