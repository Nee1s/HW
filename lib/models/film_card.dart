enum Lang { rus, bel, spa, deu, eng, fra, jpn, kor, err }

abstract class Film {
  final String id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String language;

  Film({
    this.id = "0",
    this.title = "something_gonna_wrong",
    this.picture = "",
    this.voteAverage = 5.0,
    this.releaseDate = "",
    this.description = "Какое-то описание",
    this.language = "Русский",
  });
}

class Picture extends Film {
  final String country;

  Picture({
    String id = "0",
    String title = "something_gonna_wrong",
    String picture = "",
    double voteAverage = 5.0,
    String releaseDate = "",
    String description = "Какое-то описание",
    String language = "Русский",
    this.country = "Россия",
  }) : super(
          id: id,
          title: title,
          picture: picture,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          description: description,
          language: language,
        );
}

class Serial extends Picture with mixinLanguage {
  Serial({
    String id = "0",
    String title = "something_gonna_wrong",
    String picture = "",
    double voteAverage = 5.0,
    String releaseDate = "",
    String description = "Какое-то описание",
    String language = "Русский",
    String country = "Россия",
  }) : super(
          id: id,
          title: title,
          picture: picture,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          description: description,
          language: language,
          country: country,
        ) {
    convertLang(language);
  }
}

class Movie extends Picture with mixinLanguage {
  Movie({
    String id = "0",
    String title = "something_gonna_wrong",
    String picture = "",
    double voteAverage = 5.0,
    String releaseDate = "xxxx",
    String description = "Какое-то описание",
    String language = "Русский",
    String country = "Россия",
  }) : super(
          id: id,
          title: title,
          picture: picture,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          description: description,
          language: language,
          country: country,
        ) {
    convertLang(language);
  }
}

mixin mixinLanguage {
  late Lang speech;

  void convertLang(String classLanguage) {
    switch (classLanguage) {
      case "Русский":
        speech = Lang.rus;
        break;
      case "Белорусский":
        speech = Lang.bel;
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
        print("Error_converting_language");
        break;
    }
  }
}
