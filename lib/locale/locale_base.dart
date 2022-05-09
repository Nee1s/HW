import 'package:hw/domain/movie_card_constructor.dart'
    show Lang, ConvertLangToStr;

export 'package:hw/domain/movie_card_constructor.dart'
    show Lang, ConvertLangToStr;

abstract class LocaleBase {
  //пока заготовка, чтоб не забыть
  String get title;
  String get search;
  Map<Lang, String> get enumLang;
}
