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

  const Film({
    this.id = "0",
    this.title = "something_gonna_wrong",
    this.picture = "",
    this.voteAverage = 5.0,
    this.releaseDate = "",
    this.description = "Какое-то описание",
    this.language = "Русский",
  });
}

class MixinLanguage {
  late Lang speech;

  void convertLang(String classLanguage) {
    switch (classLanguage) {
      case "Русский":
        speech = Lang.rus;
        break;
      case "Испанский":
        speech = Lang.spa;
        break;
      case "Немецкий":
        speech = Lang.deu;
        break;
      case "Английский":
        speech = Lang.eng;
        break;
      case "Французский":
        speech = Lang.fra;
        break;
      case "Японский":
        speech = Lang.jpn;
        break;
      case "Корейский":
        speech = Lang.kor;
        break;
      default:
        speech = Lang.err;
        break;
    }
  }
}
