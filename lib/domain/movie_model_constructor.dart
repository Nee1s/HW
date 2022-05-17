import 'package:hw/domain/content_model.dart';

enum Lang { rus, spa, eng, err }

extension ConvertLangToStr on Lang {
  String toPrettyString() {
    switch (this) {
      case Lang.rus:
        return "Русский";
      case Lang.spa:
        return "Испанский";
      case Lang.eng:
        return "Английский";
      default:
        return "Неизвестный язык";
    }
  }
}

abstract class Film {
  const Film({
    this.id = "0",
    this.title = "something_gonna_wrong",
    this.picture = "",
    this.voteAverage = 5.0,
    this.releaseDate = "",
    this.description = "Какое-то описание",
    this.language = "Русский",
    this.speech = Lang.rus,
  });
}

mixin MixinLanguage on MovieModel {
  //Поля примешивающиеся миксином есть зло - они ломают константный конструктор
  //В контексте текущего задания можно оботись без него, примешать метод - достаточно
  //Как работает расширение полей через extension еще предстоит разобраться
  Lang convertLang(String classLanguage) {
    switch (classLanguage) {
      case "Русский":
        return Lang.rus;
      case "Испанский":
        return Lang.spa;
      case "Немецкий":
        return Lang.deu;
      case "Английский":
        return Lang.eng;
      case "Французский":
        return Lang.fra;
      case "Японский":
        return Lang.jpn;
      case "Корейский":
        return Lang.kor;
      default:
        return Lang.err;
    }
  }
}
