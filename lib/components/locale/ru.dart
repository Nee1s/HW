import 'locale_base.dart';

class LocaleRu implements LocaleBase {
  const LocaleRu();

  @override
  String get titleApp => 'Курсы. ДЗ';

  @override
  String get search => 'Поиск';

  @override
  String get catalogTab => 'Сетка';

  @override
  String get listTab => 'Список';

  @override
  String get notedTab => 'Сохраненные';

  @override
  String get dataErrorType => 'Ошибка данных';

  @override
  String get loadingDataErrorType => 'Ошибка загрузки данных';

  @override
  String get unbelievableErrorType => 'Магия';

  @override
  String get dataBaseUsageErrorType => 'Ошибка обращения к базе';

  @override
  String get unknownErrorType => 'Неизвестный тип ошибки';

  @override
  String get emptyDataError => 'Список рецептов пуст';

  @override
  String get noDataError => 'Данные не пришли';

  @override
  String get unbelievableError => 'Вы сделали невозможное! Поздравляю!';

  @override
  String get dataBaseUsageOrderError => 'Неправаильный порядок обращения';

  @override
  String get unknownError => 'Неизвестная ошибка';
}
