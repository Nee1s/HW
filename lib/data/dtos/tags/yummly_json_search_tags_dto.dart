import 'package:json_annotation/json_annotation.dart';

part 'yummly_json_search_tags_dto.g.dart';

///ссылка на api:
///https://rapidapi.com/apidojo/api/yummly2/
///пример json'ки с данными:
///https://yummly2.p.rapidapi.com/tags/list/?rapidapi-key=2c21aeb330mshe372d92111fe6a9p12086bjsnb7624140804a
///
///Теги поиска - фильтрующие поля
///(searchId категория и тегов применяются в разных эндопиноинтах)
///
///Учитывая мультиязычность тегов, можно выдирать нужный язык, но уж больно геморно
///из-за отсуствия запроса к языку(в 1 запросе высылаются сразу все доступные языки)
///Помимо гемороя это будет еще и криво относительно архитектуры, хотя вроде как сделать можно без костылей
@JsonSerializable()
class TagsDTO {
  @JsonKey(name: 'en-US')
  final Map<String, List<OneTagDTO>>? localeTags;

  TagsDTO({
    this.localeTags,
  });

  factory TagsDTO.fromJson(Map<String, dynamic> json) =>
      _$TagsDTOFromJson(json);
}

@JsonSerializable()
class OneTagDTO {
  @JsonKey(name: 'name')
  final String? nameTag;

  @JsonKey(name: 'searchValue')
  final String? searchId;

  OneTagDTO({
    this.nameTag,
    this.searchId,
  });

  factory OneTagDTO.fromJson(Map<String, dynamic> json) =>
      _$OneTagDTOFromJson(json);
}
