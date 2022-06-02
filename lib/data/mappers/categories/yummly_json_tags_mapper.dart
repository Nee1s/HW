import 'package:hw/data/dtos/tags/yummly_json_search_tags_dto.dart';
import 'package:hw/domain/parts_recipe.dart';

extension ContentDTOToDomain on TagsDTO {
  Map<String, List<SearchTag>> toDomain() {
    final Map<String, List<SearchTag>> tempTagsContainer =
        <String, List<SearchTag>>{};

    if (localeTags?.isNotEmpty ?? false) {
      for (var typeTag in localeTags!.keys) {
        (localeTags![typeTag]?.isNotEmpty ?? false)
            ? tempTagsContainer.addAll(
                {
                  typeTag: List.generate(
                    localeTags![typeTag]!.length,
                    (index) => localeTags![typeTag]![index]._toDomain(),
                  ),
                },
              )
            : null;
      }
    }

    return tempTagsContainer;
  }
}

extension _RecipeDataDTOToDomain on OneTagDTO {
  SearchTag _toDomain() {
    return SearchTag(
      nameTag: nameTag ?? '',
      link: searchId ?? '',
    );
  }
}
