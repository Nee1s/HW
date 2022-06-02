import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hw/constants/constants.dart' as consts;

class SimplePolaroidFrame extends StatelessWidget {
  final String picture;
  final bool? isRotate;
  final bool? isRotateLeft;
  final bool? isRotateRight;

  const SimplePolaroidFrame({
    required this.picture,
    this.isRotate = true,
    this.isRotateLeft,
    this.isRotateRight,
    Key? key,
  }) : super(key: key);

  double get _randomRotateAngle {
    if (isRotate ?? false) {
      const int maxAngle = 180; //угол * 10
      const int minAngle = 90; //угол * 10

      final double sign = (isRotateLeft ?? false)
          ? -1.0
          : (isRotateRight ?? false)
              ? 1.0
              : (Random().nextInt(4) - 2.5).sign;

      final double pickerAngle =
          (Random().nextInt(maxAngle - minAngle) + minAngle) / 10;
      return sign * pickerAngle * pi / 180.0;
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int picker = Random().nextInt(1);

    return Transform.rotate(
      angle: _randomRotateAngle,
      child: AspectRatio(
        aspectRatio: 5 / 6,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double widthBox = constraints.maxWidth;
            const double factorBtmPadding = 0.05;
            final double commonBottomPadding = widthBox * factorBtmPadding;

            const double factorSideImgPadding = 0.047;
            final double sideImgPadding = factorSideImgPadding * widthBox;

            ///Что не говори, а ручками нарисованная тень гораздо лучше, чем програмно
            const double factorOffsetShadow = 0.033;
            final double offsetShadowY = widthBox * factorOffsetShadow;
            final double offsetShadowX = offsetShadowY * 0.65;

            return Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(-offsetShadowX, offsetShadowY),
                    blurRadius: 5,
                  ),
                ],
              ),
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(consts.simplePolaroids[picker]),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 5 * commonBottomPadding,
                    right: sideImgPadding,
                    left: sideImgPadding,
                  ),
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    color: Colors.black,
                    child: (picture.isNotEmpty)
                        ? Image.network(picture)
                        : Image.asset(consts.pathNoImage),
                  )),
            );
          },
        ),
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
