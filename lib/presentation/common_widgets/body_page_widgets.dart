import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/domain/content_model.dart';
import 'package:hw/presentation/themes/text_styles.dart';
import 'package:hw/utilities/wraps.dart';

import 'paddings_sizes.dart';

//Можно сделать один виджет и из рендомного числа тянуть со списков нужные показатели,
//но переписать 4 виджета в один на курсах слишком впадлу, да и из-за константного изображения фона
//грузит быстрее на моём калькуляторе. Понятно, что так лучше не делать и поддерживать такое извращение сложнее
//Поскольку сделав 1 виджет, еще нужно будет подробить его на виджеты картинки и текста, и вот тут снова встанет вопрос
//ограничений - constraints, не тот уровень гемороя для дз курсов
Widget giveMeRandPolaroid(RecipeModel model) {
  final int picker = Random().nextInt(5);
  switch (picker) {
    case 1:
      return PolaroidFrameGreen.fromModel(model: model);
    case 2:
      return PolaroidFrameRedRight.fromModel(model: model);
    case 3:
      return PolaroidFrameRedLeft.fromModel(model: model);
    case 4:
      return PolaroidFrameBlue.fromModel(model: model);
    default:
      return PolaroidFrameBlue.fromModel(model: model);
  }
}

class PolaroidFrameGreen extends StatelessWidget {
  const PolaroidFrameGreen(
      {required this.title,
      required this.picture,
      required this.link,
      Key? key})
      : super(key: key);

  final String title;
  final String picture;
  final RecipeModel link;

  factory PolaroidFrameGreen.fromModel({required RecipeModel model}) {
    return PolaroidFrameGreen(
      title: model.title,
      picture: model.imageLink,
      link: model,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -3.25 * pi / 180.0,
      child: AspectRatio(
        aspectRatio: 26 / 45,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double widthBox = constraints.maxWidth;
            final double heightBox = constraints.maxHeight;
            final double paddingImgSide = padSidePolaroidImg(widthBox);

            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/info',
                  arguments: InfoTransfer(model: link),
                );
              },
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: heightBox,
                    width: widthBox,
                    foregroundDecoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(consts.backgroundPolaroid1),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: padBottPolaroidImg(heightBox),
                        left: paddingImgSide,
                        right: paddingImgSide,
                      ),
                      child: Image.asset(
                        picture.isNotEmpty ? picture : consts.pathNoImage,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: posBottPolaroid1Txt(heightBox),
                    left: posLeftPolaroid1Txt(widthBox),
                    child: Transform.rotate(
                      angle: -pi / 0.505,
                      child: SizedBox(
                        width: sizeBoxTxtWidth1(widthBox),
                        height: sizeBoxTxtHeight1(heightBox),
                        child: Center(
                          child: AutoSizeText(
                            title,
                            style: ThemeFonts.generalNominativeStyle,
                            minFontSize: 6.0,
                            stepGranularity: 0.5,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PolaroidFrameRedRight extends StatelessWidget {
  const PolaroidFrameRedRight(
      {required this.title,
      required this.picture,
      required this.link,
      Key? key})
      : super(key: key);

  final String title;
  final String picture;
  final RecipeModel link;

  factory PolaroidFrameRedRight.fromModel({required RecipeModel model}) {
    return PolaroidFrameRedRight(
      title: model.title,
      picture: model.imageLink,
      link: model,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 4.0 * pi / 180.0,
      child: AspectRatio(
        aspectRatio: 26 / 45,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double widthBox = constraints.maxWidth;
            final double heightBox = constraints.maxHeight;
            final double paddingImgSide = padSidePolaroidImg(widthBox);

            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/info',
                  arguments: InfoTransfer(model: link),
                );
              },
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: widthBox,
                    height: heightBox,
                    foregroundDecoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(consts.backgroundPolaroid2),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: padBottPolaroidImg(heightBox),
                        left: paddingImgSide,
                        right: paddingImgSide,
                      ),
                      child: Image.asset(
                        picture.isNotEmpty ? picture : consts.pathNoImage,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: posBottPolaroid2Txt(heightBox),
                    left: posLeftPolaroid2Txt(widthBox),
                    child: Transform.rotate(
                      angle: -pi / 0.497,
                      child: SizedBox(
                        width: sizeBoxTxtWidth2(widthBox),
                        height: sizeBoxTxtHeight2(heightBox),
                        child: Center(
                          child: AutoSizeText(
                            title,
                            style: ThemeFonts.generalNominativeStyle,
                            minFontSize: 6.0,
                            stepGranularity: 0.5,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PolaroidFrameRedLeft extends StatelessWidget {
  const PolaroidFrameRedLeft(
      {required this.title,
      required this.picture,
      required this.link,
      Key? key})
      : super(key: key);

  final String title;
  final String picture;
  final RecipeModel link;

  factory PolaroidFrameRedLeft.fromModel({required RecipeModel model}) {
    return PolaroidFrameRedLeft(
      title: model.title,
      picture: model.imageLink,
      link: model,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -9.0 * pi / 180.0,
      child: AspectRatio(
        aspectRatio: 26 / 45,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double widthBox = constraints.maxWidth;
            final double heightBox = constraints.maxHeight;
            final double paddingImgSide = padSidePolaroidImg(widthBox);

            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/info',
                  arguments: InfoTransfer(model: link),
                );
              },
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: heightBox,
                    width: widthBox,
                    foregroundDecoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(consts.backgroundPolaroid3),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: padBottPolaroidImg(heightBox),
                        left: paddingImgSide,
                        right: paddingImgSide,
                      ),
                      child: Image.asset(
                        picture.isNotEmpty ? picture : consts.pathNoImage,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: posBottPolaroid3Txt(heightBox),
                    left: posLeftPolaroid3Txt(widthBox),
                    child: Transform.rotate(
                      angle: -pi / 0.4955,
                      child: SizedBox(
                        width: sizeBoxTxtWidth3(widthBox),
                        height: sizeBoxTxtHeight3(heightBox),
                        child: Center(
                          child: AutoSizeText(
                            title,
                            style: ThemeFonts.generalNominativeStyle,
                            minFontSize: 6.0,
                            stepGranularity: 0.5,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PolaroidFrameBlue extends StatelessWidget {
  const PolaroidFrameBlue(
      {required this.title,
      required this.picture,
      required this.link,
      Key? key})
      : super(key: key);

  final String title;
  final String picture;
  final RecipeModel link;

  factory PolaroidFrameBlue.fromModel({required RecipeModel model}) {
    return PolaroidFrameBlue(
      title: model.title,
      picture: model.imageLink,
      link: model,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 7.75 * pi / 180.0,
      child: AspectRatio(
        aspectRatio: 26 / 45,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double widthBox = constraints.maxWidth;
            final double heightBox = constraints.maxHeight;
            final double paddingImgSide = padSidePolaroidImg(widthBox);

            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/info',
                  arguments: InfoTransfer(model: link),
                );
              },
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: heightBox,
                    width: widthBox,
                    foregroundDecoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(consts.backgroundPolaroid4),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: padBottPolaroidImg(heightBox),
                        left: paddingImgSide,
                        right: paddingImgSide,
                      ),
                      child: Image.asset(
                        picture.isNotEmpty ? picture : consts.pathNoImage,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: posBottPolaroid4Txt(heightBox),
                    left: posLeftPolaroid4Txt(widthBox),
                    child: Transform.rotate(
                      angle: -pi / 0.5059,
                      child: SizedBox(
                        width: sizeBoxTxtWidth4(widthBox),
                        height: sizeBoxTxtHeight4(heightBox),
                        child: Center(
                          child: AutoSizeText(
                            title,
                            style: ThemeFonts.generalNominativeStyle,
                            minFontSize: 6.0,
                            stepGranularity: 0.5,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
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

class TabletFavorite extends StatefulWidget {
  const TabletFavorite({Key? key}) : super(key: key);

  @override
  State<TabletFavorite> createState() => _TabletFavoriteState();
}

class _TabletFavoriteState extends State<TabletFavorite> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
