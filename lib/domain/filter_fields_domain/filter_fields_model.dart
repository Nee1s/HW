import 'package:hw/domain/parts_recipe.dart';

import 'group_recipe_model.dart';

class FilterFieldsModel {
  final List<ViewCategory> categoryList;
  final Map<String, List<SearchTag>> tagsContainer;

  const FilterFieldsModel({
    required this.categoryList,
    required this.tagsContainer,
  });
}
