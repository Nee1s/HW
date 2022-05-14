import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/domain/content_model.dart';

class Book extends StatelessWidget {
  const Book({
    required this.title,
    required this.description,
    required this.language,
    required this.voteAverage,
    required this.releaseDate,
    required this.pictureLink,
    Key? key,
  }) : super(key: key);

  final String title;
  final String pictureLink;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String language;

  factory Book.fromModel(MovieCard model) {
    return Book(
      title: model.title,
      pictureLink: model.picture,
      voteAverage: model.voteAverage,
      releaseDate: model.releaseDate,
      description: model.description,
      language: model.language,
    );
  }

  //Это колдунство возможно пригодится в будущем
  //оно разбивает строку текста на две относительно равномерных
  //строки в разрезе конкретного поля описания, часть описания
  //на одной стороне страницы "книги", часть описания на другой странице
  //Это не совсем полный вариант.
  // Map<parts, String> divideDescription() {
  //   final int? _dividePosition;
  //   final int _idxHalfDescription =
  //       description.indexOf(' ', (description.length / 2).floor());
  //
  //   final int calculate =
  //       description.length > 120 ? description.indexOf(' ', 120) : -1;
  //   _dividePosition = calculate > 0 && description.length - calculate > 40
  //       ? calculate
  //       : _idxHalfDescription > 0
  //           ? _idxHalfDescription
  //           : description.length;
  //   try {
  //     return {
  //       parts.partOne: description.substring(0, _dividePosition),
  //       parts.partTwo: description.substring(_dividePosition + 1),
  //     };
  //   } on RangeError {
  //     return {
  //       parts.partOne: description,
  //       parts.partTwo: '',
  //     };
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //final Map<parts, String> _description = divideDescription();

    return AspectRatio(
      aspectRatio: 31 / 19,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double widthBox = constraints.maxWidth;
          final double heightBox = constraints.maxHeight;

          const double factorPadVertical = 0.08;
          const double factorPadHorizontal = 0.06;

          final double padVertical = heightBox * factorPadVertical;
          final double padHorizontal = widthBox * factorPadHorizontal;

          const double factorTxtScale = 13.1;
          final double minFontSize =
              (factorTxtScale * heightBox / widthBox).floor().toDouble();

          return Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(consts.bookBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: padHorizontal,
                    vertical: padVertical,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Center(
                                child:
                                    SimplePolaroidFrame(picture: pictureLink),
                              ),
                            ),
                            //На тексте тени нету, но это
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Center(
                                  child: AutoSizeText(
                                    title,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    minFontSize: minFontSize,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  '$releaseDate г.',
                                  maxLines: 1,
                                  minFontSize: minFontSize,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Оценка: $voteAverage',
                                  maxLines: 1,
                                  minFontSize: minFontSize,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Варианты озвучивания:\n$language',
                                  maxLines: 2,
                                  minFontSize: minFontSize,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Гугл сказал так нормально делать, но я не уверен
                      //виджет Wrap, вроде не работает с Expanded, по понятным причинам
                      const Expanded(
                        flex: 2,
                        child: SizedBox.shrink(),
                      ),
                      //Можно было поиграться с вырваниваниями, что бы в колонку не оборачивать текст
                      //но время уже совсем как песок
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: [
                            AutoSizeText(
                              description,
                              maxLines: 11,
                              minFontSize: 8,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}

class SimplePolaroidFrame extends StatelessWidget {
  final String picture;

  const SimplePolaroidFrame({required this.picture, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 26 / 45,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double widthBox = constraints.maxWidth;
          final double heightBox = constraints.maxHeight;

          const double factorWidthPaddingImgSide = 0.045;
          final double paddingImgSide = widthBox * factorWidthPaddingImgSide;

          const double factorHeightPaddingImgBott = 0.130;
          final double paddingImgBottom =
              heightBox * factorHeightPaddingImgBott;

          final double randAngleRotation = (Random().nextInt(180) - 90) / 10;

          return Transform.rotate(
            angle: randAngleRotation * pi / 180.0,
            child: Container(
              alignment: Alignment.center,
              width: widthBox,
              foregroundDecoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(consts.backgroundSimplePolaroidOne),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: paddingImgBottom,
                  left: paddingImgSide,
                  right: paddingImgSide,
                ),
                child: Image.asset(
                  picture.isNotEmpty ? picture : consts.pathNoImage,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

String randPolaroidBackground() {
  final int picker = Random().nextInt(2);
  if (picker == 0) {
    return consts.backgroundSimplePolaroidOne;
  } else {
    return consts.backgroundSimplePolaroidTwo;
  }
}
