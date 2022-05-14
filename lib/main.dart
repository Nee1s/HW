import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/pages/scroll/scroll_page.dart';
//import 'package:hw/presentation/pages/tape/home_page.dart'; //- забыть как страшный сон
import 'package:hw/presentation/themes/themes_films_app.dart' as themes;
import 'package:hw/root_bloc/bloc.dart';

void main() => runApp(const HWAppCourses());

class HWAppCourses extends StatelessWidget {
  const HWAppCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final List<MovieCard> _list = generateListFilms();
    return MaterialApp(
      theme: themes.lightMainTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: themes.darkMainTheme,
      themeMode: ThemeMode.light,
      home: BlocProvider<RootBloc>(
        lazy: false,
        create: (_) => RootBloc(),
        child: const ScrollPage(),
      ),
    );
    //home: const MainPage(),
  }
}
