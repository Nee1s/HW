// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yummly_json_category_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) => CategoryDTO(
      categories: (json['browse-categories'] as List<dynamic>?)
          ?.map((e) => CategoryItemsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryDTOToJson(CategoryDTO instance) =>
    <String, dynamic>{
      'browse-categories': instance.categories,
    };

CategoryItemsDTO _$CategoryItemsDTOFromJson(Map<String, dynamic> json) =>
    CategoryItemsDTO(
      headCategory: json['display'] == null
          ? null
          : HeadCategoryDTO.fromJson(json['display'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryItemsDTOToJson(CategoryItemsDTO instance) =>
    <String, dynamic>{
      'display': instance.headCategory,
    };

HeadCategoryDTO _$HeadCategoryDTOFromJson(Map<String, dynamic> json) =>
    HeadCategoryDTO(
      headCategoryName: json['displayName'] as String?,
      headCategoryLinkImage: json['categoryImage'] as String?,
      headCategoryLinkIcon: json['iconImage'] as String?,
      headCategorySearchId: json['tag'] as String?,
      listSubCategory: (json['categoryTopics'] as List<dynamic>?)
          ?.map((e) => CategorySubItemsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HeadCategoryDTOToJson(HeadCategoryDTO instance) =>
    <String, dynamic>{
      'displayName': instance.headCategoryName,
      'iconImage': instance.headCategoryLinkIcon,
      'categoryImage': instance.headCategoryLinkImage,
      'tag': instance.headCategorySearchId,
      'categoryTopics': instance.listSubCategory,
    };

CategorySubItemsDTO _$CategorySubItemsDTOFromJson(Map<String, dynamic> json) =>
    CategorySubItemsDTO(
      subCategoryItems: json['display'] == null
          ? null
          : SubCategoryDTO.fromJson(json['display'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategorySubItemsDTOToJson(
        CategorySubItemsDTO instance) =>
    <String, dynamic>{
      'display': instance.subCategoryItems,
    };

SubCategoryDTO _$SubCategoryDTOFromJson(Map<String, dynamic> json) =>
    SubCategoryDTO(
      nameSubCategory: json['displayName'] as String?,
      subCategoryLinkImage: json['iconImage'] as String?,
      subCategorySearchId: json['tag'] as String?,
    );

Map<String, dynamic> _$SubCategoryDTOToJson(SubCategoryDTO instance) =>
    <String, dynamic>{
      'displayName': instance.nameSubCategory,
      'iconImage': instance.subCategoryLinkImage,
      'tag': instance.subCategorySearchId,
    };
