import 'package:flutter/material.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/presentation/themes/text_styles.dart';

//Можно и весь AppBar по итоге переписать, но чета жестковато
//переписывать распознование маршрутов и отрисовку стрелки назад,
//центровку лидинга, экшена и текста, время то не резиновое
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
      titleTextStyle: ThemeFonts.generalDeclarativeStyle,
      iconTheme: const IconThemeData(
          color: Color(0xffff7e00), opacity: 0.85, size: 12.0),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/search');
          },
        ),
      ],
    );
  }
}
