import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/pages/preview_list/bloc/preview_bloc.dart';
import 'package:hw/presentation/pages/preview_list/preview_page.dart';
import 'package:hw/presentation/themes/themes_films_app.dart' as themes;
import 'package:hw/root_bloc/bloc.dart';

void main() => runApp(const HWAppCourses());

class HWAppCourses extends StatelessWidget {
  const HWAppCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final List<MovieCard> _list = generateListFilms();
    return BlocProvider<RootBloc>(
      lazy: false,
      create: (_) => RootBloc(),
      child: MaterialApp(
        theme: themes.lightMainTheme,
        debugShowCheckedModeBanner: false,
        darkTheme: themes.darkMainTheme,
        themeMode: ThemeMode.light,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => BlocProvider<PreviewPageBloc>(
                lazy: false,
                create: (_) => PreviewPageBloc(),
                child: const PreviewPage(),
              ),
        },
      ),
    );
    //home: const MainPage(),
  }
}
