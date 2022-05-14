import 'package:flutter/material.dart';

final double heightScreen =
    WidgetsBinding.instance!.window.physicalSize.height /
            WidgetsBinding.instance!.window.devicePixelRatio -
        AppBar().preferredSize.height;
final double widthScreen = WidgetsBinding.instance!.window.physicalSize.width /
    WidgetsBinding.instance!.window.devicePixelRatio;
