import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/pages/tape/bloc/bloc.dart';
import 'package:hw/presentation/pages/tape/home_page.dart';
import 'package:hw/presentation/themes/themes_films_app.dart' as themes;

void main() => runApp(const HWAppCourses());

class HWAppCourses extends StatelessWidget {
  const HWAppCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themes.lightMainTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: themes.darkMainTheme,
      themeMode: ThemeMode.dark,
      home: BlocProvider<RootBloc>(
        lazy: false,
        create: (_) => RootBloc(),
        child: const MainPage(),
      ),
    );
  }
}
