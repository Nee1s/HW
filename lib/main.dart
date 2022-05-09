import 'package:flutter/material.dart';
import 'package:hw/domain/content_model.dart';
import 'package:hw/presentation/pages/common_widgets/widgets.dart';
//import 'package:hw/presentation/pages/tape/home_page.dart'; //- забыть как страшный сон
import 'package:hw/presentation/themes/themes_films_app.dart' as themes;

void main() => runApp(const HWAppCourses());

class HWAppCourses extends StatelessWidget {
  const HWAppCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MovieCard> _list = generateListFilms();
    return MaterialApp(
      theme: themes.lightMainTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: themes.darkMainTheme,
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 450),
                      child: giveMeRandPolaroid(_list[1]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 450),
                      child: giveMeRandPolaroid(_list[1]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 450),
                      child: giveMeRandPolaroid(_list[4]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 450),
                      child: giveMeRandPolaroid(_list[5]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      //home: const MainPage(),
    );
  }
}
