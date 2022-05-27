import 'package:hw/domain/movie_model_constructor.dart'
    show Lang, ConvertLangToStr;

abstract class LocaleBase {
  //пока заготовка, чтоб не забыть
  String get title;
  String get search;
  Map<Lang, String> get enumLang;
}
