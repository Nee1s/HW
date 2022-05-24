// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yummly_json_search_tags_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagsDTO _$TagsDTOFromJson(Map<String, dynamic> json) => TagsDTO(
      localeTags: (json['en-US'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => OneTagDTO.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$TagsDTOToJson(TagsDTO instance) => <String, dynamic>{
      'en-US': instance.localeTags,
    };

OneTagDTO _$OneTagDTOFromJson(Map<String, dynamic> json) => OneTagDTO(
      nameTag: json['name'] as String?,
      searchId: json['searchValue'] as String?,
    );

Map<String, dynamic> _$OneTagDTOToJson(OneTagDTO instance) => <String, dynamic>{
      'name': instance.nameTag,
      'searchValue': instance.searchId,
    };
