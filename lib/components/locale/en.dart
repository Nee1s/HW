import 'locale_base.dart';

class LocaleEn implements LocaleBase {
  const LocaleEn();

  @override
  String get titleApp => 'HW Courses';

  @override
  String get search => 'Search';

  @override
  String get catalogTab => 'Catalog';

  @override
  String get listTab => 'List';

  @override
  String get notedTab => 'Noted';

  @override
  String get dataErrorType => 'Data error';

  @override
  String get loadingDataErrorType => 'Load data error';

  @override
  String get unbelievableErrorType => "It's magic!";

  @override
  String get dataBaseUsageErrorType => 'Database usage error';

  @override
  String get unknownErrorType => 'Unknown type error';

  @override
  String get emptyDataError => 'Recipe list is empty';

  @override
  String get noDataError => "Data wasn't received";

  @override
  String get unbelievableError => 'You are do some magic! Congratulation!';

  @override
  String get dataBaseUsageOrderError => 'Wrong manipulation order';

  @override
  String get unknownError => 'Unknown error';
}
