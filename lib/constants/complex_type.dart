import 'package:flutter_cache_manager/flutter_cache_manager.dart';

enum parts { partOne, partTwo }

const List<String> polaroidsTitle = [
  'assets/backgrounds/polaroid_one.png',
  'assets/backgrounds/polaroid_two.png',
  'assets/backgrounds/polaroid_three.png',
  'assets/backgrounds/polaroid_four.png',
];

const List<String> simplePolaroids = [
  'assets/backgrounds/simple_polaroid_one.png',
  'assets/backgrounds/simple_polaroid_two.png',
];

class RecipeLocal {
  static const String titleApp = 'Курсы. ДЗ';

  static const String ratingPrefix = 'Оценка: ';
  static const String search = 'Поиск';

  static const String dataErrorType = 'Ошибка данных';
  static const String loadingDataErrorType = 'Ошибка загрузки данных';
  static const String unbelievableErrorType = 'Магия';
  static const String dataBaseUsageErrorType = 'Ошибка обращения к базе';
  static const String unknownErrorType = 'Неизвестный тип ошибки';

  static const String emptyDataError = 'Список рецептов пуст';
  static const String noDataError = 'Данные не пришли';
  static const String unbelievableError = 'Вы сделали невозможное! Поздравляю!';
  static const String dataBaseUsageOrderError =
      'Неправаильный порядок обращения';
  static const String unknownError = 'Неизвестная ошибка';
}

class AppPictures {
  static CacheManager pictureCache =
      CacheManager(Config('recipeImg', stalePeriod: const Duration(days: 7)));
}
