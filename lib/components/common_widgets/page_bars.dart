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
    const double ratioPicture = 0.133;
    const double maxAcceptableFactor = 0.54;

    final double height =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
    final double width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

    final double revertRatioSides = 2 - width / height;

    late final double appBarHeight;
    appBarHeight =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).orientation ==
                Orientation.portrait
            ? width * ratioPicture
            : width *
                ratioPicture *
                (revertRatioSides > maxAcceptableFactor
                    ? revertRatioSides
                    : maxAcceptableFactor);
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
        color: Colors.amber,
        opacity: 0.4,
        size: 25.0,
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.of(context).pushNamed('/settings'),
          icon: const Icon(Icons.settings),
        ),
      ],
      actionsIconTheme: const IconThemeData(
        color: Colors.amber,
        opacity: 0.4,
        size: 35.0,
      ),
    );
  }
}
