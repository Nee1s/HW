import 'package:flutter/material.dart';
import 'package:hw/bloc/error_bloc/error_bloc.dart';
import 'package:hw/bloc/root_bloc/bloc.dart';
import 'package:hw/components/wraps.dart';
import 'package:hw/data/repositories/recipes/yummly_recipes_repository.dart';
import 'package:hw/presentation/pages/info/info_page.dart';
import 'package:hw/presentation/pages/preview/preview_page.dart';
import 'package:hw/presentation/pages/search/search_page.dart';
import 'package:hw/presentation/themes/themes_films_app.dart' as themes;

void main() => runApp(const HWAppCourses());

class HWAppCourses extends StatelessWidget {
  const HWAppCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final List<MovieCard> _list = generateListFilms();
    return BlocProvider<ErrorBloc>(
      lazy: false,
      create: (_) => ErrorBloc(),
      child: RepositoryProvider<RecipesRepository>(
        lazy: true,
        create: (BuildContext context) => RecipesRepository(
          onErrorHandler: (String code, String message) {
            context
                .read<ErrorBloc>()
                .add(LoadingDataErrorEvent(code: code, message: message));
          },
        ),
        child: BlocProvider<RootBloc>(
          lazy: false,
          create: (BuildContext context) =>
              RootBloc(context.read<RecipesRepository>()),
          child: MaterialApp(
            theme: themes.lightMainTheme,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            initialRoute: '/',
            //Что-то картинка на bottomNavigationBar сильно попахивает
            //время будет - заменю.
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
                        return InfoPage.fromModel(
                          model: linkModel.getLinkModel,
                        );
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
        ),
      ),
    );
    //home: const MainPage(),
  }
}
