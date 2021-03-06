import 'package:flutter/material.dart';
import 'package:hw/bloc/error_bloc/error_bloc.dart';
import 'package:hw/bloc/root_bloc/bloc.dart';
import 'package:hw/components/common_widgets/widgets.dart';
import 'package:hw/components/delayed_action.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/presentation/pages/preview/bloc/preview_bloc.dart';

import 'grid_view_widgets.dart';
import 'list_view_widgets.dart';

class PreviewPage extends StatefulWidget {
  static final GlobalKey<State<StatefulWidget>> globalKey = GlobalKey();

  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  final TextEditingController textController = TextEditingController();

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
    return BlocProvider<PreviewPageBloc>(
      lazy: false,
      create: (_) => PreviewPageBloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: const CommonAppBar(title: consts.RecipeLocal.titleApp),
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
              child: Column(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        bottom: 20.0,
                      ),
                      child: TextField(
                        key: const ValueKey('filter_field'),
                        controller: textController,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          labelText: consts.RecipeLocal.search,
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        onChanged: _onSearchFieldTextChanged,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: RefreshIndicator(
                      onRefresh: _onPullToRefresh,
                      child: BlocBuilder<PreviewPageBloc, PreviewPState>(
                        buildWhen: (oldS, newS) =>
                            oldS.tabIndex != newS.tabIndex,
                        builder: (context, state) {
                          if (state.tabIndex == 0) {
                            return const Center(child: CatalogView());
                          } else if (state.tabIndex == 1) {
                            return const ScrollListView();
                          } else {
                            context.read<ErrorBloc>().add(
                                const UnbelievableErrorEvent(
                                    place: 'tab index'));
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Дойдут руки - напишу нормальный bottomNavigationBar с анимацей,
          //а не это "чудо" инженерной мысли, с подменой картинок
          bottomNavigationBar: const BottomNavBar(),
        ),
      ),
    );
  }

  void _onSearchFieldTextChanged(String text) {
    DelayedAction.run(() {
      context.read<RootBloc>().add(SearchDataEvent(search: text));
    });
  }

  Future<void> _onPullToRefresh() async {
    context.read<RootBloc>().add(const PreloadDataEvent());
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviewPageBloc, PreviewPState>(
      buildWhen: (oldS, newS) => oldS.tabIndex != newS.tabIndex,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  state.tabIndex! == 0
                      ? consts.btmNavBarFirstTab
                      : consts.btmNavBarSecondTab,
                ),
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
    );
  }
}
