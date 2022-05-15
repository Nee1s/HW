import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/presentation/pages/common_widgets/widgets.dart';
import 'package:hw/presentation/pages/preview_list/bloc/preview_bloc.dart';
import 'package:hw/root_bloc/bloc.dart';

import 'grid_view_widgets.dart';
import 'list_view_widgets.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  void didChangeDependencies() {
    context.read<RootBloc>().add(const PreloadDataEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;

    const double factorCommonPadding = 0.02;
    final double paddingCommon = heightScreen * factorCommonPadding;
    //widget PageView тобишь вся страница с двумя представлениями списка
    return SafeArea(
      child: Scaffold(
        appBar: const CommonAppBar(title: 'Catalog'),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(consts.scaffoldBackground), fit: BoxFit.fill),
          ),
          foregroundDecoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(consts.gridBackground), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.all(paddingCommon),
            child: BlocBuilder<PreviewPageBloc, PreviewPState>(
              buildWhen: (oldS, newS) => oldS.tabIndex != newS.tabIndex,
              builder: (context, state) {
                return state.tabIndex == 0
                    ? const Center(child: CatalogView())
                    : state.tabIndex == 1
                        ? const ScrollListView()
                        : const Center(
                            child: AutoSizeText(
                              'Что-то пошло не так',
                              maxLines: 4,
                            ),
                          );
              },
            ),
          ),
        ),
        //Дойдут руки - напишу нормальный bottomNavigationBar с анимацей,
        //а не это "чудо" инженерной мысли, с подменой картинок
        bottomNavigationBar: BlocBuilder<PreviewPageBloc, PreviewPState>(
          buildWhen: (oldS, newS) => oldS.tabIndex != newS.tabIndex,
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(state.tabIndex! == 0
                        ? 'assets/backgrounds/bottomTabBarLeft.jpg'
                        : 'assets/backgrounds/bottomTabBarRight.jpg'),
                    fit: BoxFit.fill),
              ),
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.grid_view),
                    label: 'Catalog',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'List',
                  ),
                ],
                selectedItemColor: const Color(0xffff8800),
                unselectedItemColor: const Color(0xffdd9475),
                backgroundColor: Colors.transparent,
                currentIndex: state.tabIndex!,
                onTap: (newIndex) {
                  if (state.tabIndex! != newIndex) {
                    context
                        .read<PreviewPageBloc>()
                        .add(ReplaceViewEvent(changedTab: newIndex));
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
