import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hw/bloc/error_bloc/error_bloc.dart';
import 'package:hw/bloc/root_bloc/bloc.dart';
import 'package:hw/bloc/settings_bloc/settings_bloc.dart';
import 'package:hw/bloc/settings_bloc/settings_bloc_event.dart';
import 'package:hw/bloc/settings_bloc/settings_bloc_state.dart';
import 'package:hw/components/locale/locals.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/data/repositories/recipes/yummly_recipes_repository.dart';
import 'package:hw/domain/content_model.dart';
import 'package:hw/presentation/pages/info/info_page.dart';
import 'package:hw/presentation/pages/preview/preview_page.dart';
import 'package:hw/presentation/pages/search/search_page.dart';
import 'package:hw/presentation/pages/settings/settings_page.dart';
import 'package:hw/presentation/themes/themes_films_app.dart' as themes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(const HWAppCourses());
}

class HWAppCourses extends StatelessWidget {
  const HWAppCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ErrorBloc>(
      lazy: false,
      create: (_) => ErrorBloc(),
      child: BlocProvider<SettingsBloc>(
        lazy: false,
        create: (_) => SettingsBloc(),
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
            child: const Application(),
          ),
        ),
      ),
    );
  }
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  static final GlobalKey<State<StatefulWidget>> globalKey = GlobalKey();

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void didChangeDependencies() {
    //вкурсе что коряво
    context
        .read<SettingsBloc>()
        .add(const LoadSettingEvent(nameSetting: consts.localeSettingPref));
    super.didChangeDependencies();

    // bool isNotDone = true;
    // Future.delayed(const Duration(milliseconds: 100), () => isNotDone = false);
    // do {
    //   null;
    // } while (isNotDone);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter courses',
          locale: state.locale,
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            MyLocalizationsDelegate(initialLocals),
          ],
          supportedLocales: availableLocales.values,
          theme: themes.lightMainTheme,
          themeMode: ThemeMode.light,
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            PreviewPage.path: (context) => const PreviewPage(),
            SearchPage.path: (context) => const SearchPage(),
            SettingsPage.path: (context) => const SettingsPage(),
          },
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case InfoPage.path:
                {
                  final RecipeModel linkModel =
                      (settings.arguments as TransferDetail).getLinkModel;

                  return MaterialPageRoute(
                    builder: (context) {
                      return InfoPage.fromModel(
                        model: linkModel,
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
        );
      },
    );
  }
}

abstract class TransferDetail {
  RecipeModel get getLinkModel;
}
