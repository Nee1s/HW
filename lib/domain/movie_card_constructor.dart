enum Lang { rus, spa, deu, eng, fra, jpn, kor, err }

extension ConvertLangToStr on Lang {
  String toPrettyString() {
    switch (this) {
      case Lang.rus:
        return "Русский";
      case Lang.spa:
        return "Испанский";
      case Lang.deu:
        return "Немецкий";
      case Lang.eng:
        return "Английский";
      case Lang.fra:
        return "Французский";
      case Lang.jpn:
        return "Японский";
      case Lang.kor:
        return "Корейский";
      default:
        return "Неизвестный язык";
    }
  }
}

abstract class Film {
  final String id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String language;
  final Lang speech;

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

mixin MixinLanguage {
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
