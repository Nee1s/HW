import 'package:hw/domain/nutrition_recipe.dart';

abstract class LocaleBase {
  //пока заготовка, чтоб не забыть
  String get title;
  String get search;
  Map<Nutrient, String> get enumLang;
}
