import 'package:flutter/material.dart';
import 'package:hw/presentation/pages/info/info_page.dart';
import 'package:hw/presentation/pages/preview/preview_page.dart';
import 'package:hw/presentation/pages/search/search_page.dart';
import 'package:hw/presentation/themes/themes_films_app.dart' as themes;
import 'package:hw/root_bloc/bloc.dart';
import 'package:hw/utilities/wraps.dart';

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
          '/': (context) => const PreviewPage(),
          '/search': (context) => const SearchPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case InfoPage.path:
              {
                final InfoTransfer linkModel =
                    settings.arguments as InfoTransfer;

                return MaterialPageRoute(
                  builder: (context) {
                    return InfoPage.fromModel(model: linkModel.model);
                  },
                );
              }
            //Смущает меня что он предупреждает, что он может ничего не вернуть в случае
            //если RouteSettings.name не совпадет с моими вариантами, лучше уж перейдем
            //на основную страницу со списками
            default:
              return MaterialPageRoute(
                builder: (context) {
                  return const PreviewPage();
                },
              );
          }
        },
      ),
    );
    //home: const MainPage(),
  }
}
