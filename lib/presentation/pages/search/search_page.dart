import 'package:flutter/material.dart';
import 'package:hw/bloc/root_bloc/bloc.dart';
import 'package:hw/components/common_widgets/widgets.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/presentation/pages/search/bloc/search_bloc.dart';

import 'search_page_widgets.dart';

///А так хотелось полноценную страницу по поиску запилить
///Оставил, посмотрим что будет
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;

    const double factorCommonPadding = 0.02;
    final double paddingCommon = heightScreen * factorCommonPadding;

    return BlocProvider<SearchBloc>(
      lazy: false,
      create: (_) => SearchBloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: const CommonAppBar(title: consts.RecipeLocal.search),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(consts.scaffoldBackgrnd), fit: BoxFit.fill),
            ),
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(consts.gridBackgrnd), fit: BoxFit.fill),
            ),
            child: Padding(
                padding: EdgeInsets.all(paddingCommon),
                child: const FilterFields()),
          ),
          //Дойдут руки - напишу нормальный bottomNavigationBar с анимацей,
          //а не это "чудо" инженерной мысли, с подменой картинок
        ),
      ),
    );
  }
}
