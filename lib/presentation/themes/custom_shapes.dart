import 'package:flutter/material.dart';

class BannerFlag extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path() // Начальная точка в (0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width / 2, (size.height / 3) * 2)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
