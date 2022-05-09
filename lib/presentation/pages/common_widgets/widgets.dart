import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/domain/content_model.dart';

import 'paddings_sizes.dart';

Widget giveMeRandPolaroid(MovieCard model) {
  final int picker = Random().nextInt(5);
  switch (picker) {
    case 1:
      return PolaroidFrame1(model: model);
    case 2:
      return PolaroidFrame2(model: model);
    case 3:
      return PolaroidFrame3(model: model);
    case 4:
      return PolaroidFrame4(model: model);
    default:
      return PolaroidFrame4(model: model);
  }
}

class PolaroidFrame1 extends StatelessWidget {
  final MovieCard model;

  const PolaroidFrame1({required this.model, Key? key}) : super(key: key);

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
            angle: -pi / 0.49,
            child: Stack(
              children: [
                Container(
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
                      model.picture.isNotEmpty
                          ? model.picture
                          : consts.pathNoImage,
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
                          child: FittedBox(
                            child: Text(
                              model.title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PolaroidFrame2 extends StatelessWidget {
  final MovieCard model;

  const PolaroidFrame2({required this.model, Key? key}) : super(key: key);

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
            angle: -pi / 0.50205,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: widthBox,
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
                      model.picture.isNotEmpty
                          ? model.picture
                          : consts.pathNoImage,
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
                          child: FittedBox(
                            child: Text(
                              model.title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )),
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
  final MovieCard model;

  const PolaroidFrame3({required this.model, Key? key}) : super(key: key);

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
            angle: -pi / 0.4955,
            child: Stack(
              children: [
                Container(
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
                      model.picture.isNotEmpty
                          ? model.picture
                          : consts.pathNoImage,
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
                          child: FittedBox(
                            child: Text(
                              model.title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )),
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
  final MovieCard model;

  const PolaroidFrame4({required this.model, Key? key}) : super(key: key);

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
            angle: -pi / 0.5085,
            child: Stack(
              children: [
                Container(
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
                      model.picture.isNotEmpty
                          ? model.picture
                          : consts.pathNoImage,
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
                          child: FittedBox(
                            child: Text(
                              model.title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
