import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/domain/content_model.dart';

import 'paddings_sizes.dart';

//Можно сделать один виджет и из рендомного числа тянуть со списков нужные показатели,
//но переписать 4 виджета в один на курсах слишком впадлу, да и из-за константного изображения фона
//грузит быстрее на моём калькуляторе. Понятно, что так лучше не делать и поддерживать такое извращение сложнее
//Поскольку сделав 1 виджет, еще нужно будет подробить его на виджеты картинки и текста, и вот тут снова встанет вопрос
//ограничений - constraints, не тот уровень гемороя для дз курсов
Widget giveMeRandPolaroid(MovieCard model) {
  final int picker = Random().nextInt(5);
  switch (picker) {
    case 1:
      return PolaroidFrame1.fromModel(model: model);
    case 2:
      return PolaroidFrame2.fromModel(model: model);
    case 3:
      return PolaroidFrame3.fromModel(model: model);
    case 4:
      return PolaroidFrame4.fromModel(model: model);
    default:
      return PolaroidFrame4.fromModel(model: model);
  }
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({required this.title, Key? key}) : super(key: key);

  final String title;

  //Немного магии без констант. Метод задает размеры AppBar относительно экрана
  //Потому что Scaffold берет размеры AppBar из переменной/геттера preferredSize
  @override
  Size get preferredSize {
    const double _ratioPicture = 0.133;
    const double _maxAcceptableFactor = 0.54;

    final double _height =
        MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
    final double _width =
        MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;

    final double _revertRatioSides = 2 - _width / _height;

    late final double appBarHeight;
    appBarHeight = MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                .orientation ==
            Orientation.portrait
        ? _width * _ratioPicture
        : _width *
            _ratioPicture *
            (_revertRatioSides > _maxAcceptableFactor
                ? _revertRatioSides
                : _maxAcceptableFactor);
    return Size.fromHeight(appBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(consts.appBarBck),
            fit: BoxFit.fill,
          ),
        ),
      ),
      elevation: 15.0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
          color: Color(0xffbdbdbd),
          fontSize: 26.0,
          fontFamily: 'KingthingsPetrock'),
      iconTheme: const IconThemeData(
          color: Color(0xffff7e00), opacity: 0.85, size: 12.0),
    );
  }
}

class PolaroidFrame1 extends StatelessWidget {
  final String title;
  final String picture;

  const PolaroidFrame1({required this.title, required this.picture, Key? key})
      : super(key: key);

  factory PolaroidFrame1.fromModel({required MovieCard model}) {
    return PolaroidFrame1(
      title: model.title,
      picture: model.picture,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 26 / 45,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double widthBox = constraints.maxWidth;
            final double heightBox = constraints.maxHeight;
            final double paddingImgSide = padSidePolaroidImg(widthBox);

            return Transform.rotate(
              angle: -3.25 * pi / 180.0,
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 26 / 45,
                    child: Container(
                      alignment: Alignment.center,
                      width: widthBox,
                      foregroundDecoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(consts.backgroundPolaroid1),
                          fit: BoxFit.fitWidth,
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

class PolaroidFrame2 extends StatelessWidget {
  final String title;
  final String picture;

  const PolaroidFrame2({required this.title, required this.picture, Key? key})
      : super(key: key);

  factory PolaroidFrame2.fromModel({required MovieCard model}) {
    return PolaroidFrame2(
      title: model.title,
      picture: model.picture,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 26 / 45,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double widthBox = constraints.maxWidth;
          final double heightBox = constraints.maxHeight;
          final double paddingImgSide = padSidePolaroidImg(widthBox);

          return Transform.rotate(
            angle: 4.0 * pi / 180.0,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 26 / 45,
                  child: Container(
                    alignment: Alignment.center,
                    width: widthBox,
                    height: heightBox,
                    foregroundDecoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(consts.backgroundPolaroid2),
                        fit: BoxFit.fitWidth,
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
    );
  }
}

class PolaroidFrame3 extends StatelessWidget {
  final String title;
  final String picture;

  const PolaroidFrame3({required this.title, required this.picture, Key? key})
      : super(key: key);

  factory PolaroidFrame3.fromModel({required MovieCard model}) {
    return PolaroidFrame3(
      title: model.title,
      picture: model.picture,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 26 / 45,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double widthBox = constraints.maxWidth;
          final double heightBox = constraints.maxHeight;
          final double paddingImgSide = padSidePolaroidImg(widthBox);

          return Transform.rotate(
            angle: -9.0 * pi / 180.0,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 26 / 45,
                  child: Container(
                    alignment: Alignment.center,
                    width: widthBox,
                    foregroundDecoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(consts.backgroundPolaroid3),
                        fit: BoxFit.fitWidth,
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
    );
  }
}

class PolaroidFrame4 extends StatelessWidget {
  final String title;
  final String picture;

  const PolaroidFrame4({required this.title, required this.picture, Key? key})
      : super(key: key);

  factory PolaroidFrame4.fromModel({required MovieCard model}) {
    return PolaroidFrame4(
      title: model.title,
      picture: model.picture,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 26 / 45,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double widthBox = constraints.maxWidth;
          final double heightBox = constraints.maxHeight;
          final double paddingImgSide = padSidePolaroidImg(widthBox);

          return Transform.rotate(
            angle: 7.75 * pi / 180.0,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 26 / 45,
                  child: Container(
                    alignment: Alignment.center,
                    width: widthBox,
                    foregroundDecoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(consts.backgroundPolaroid4),
                        fit: BoxFit.fitWidth,
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
    );
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
