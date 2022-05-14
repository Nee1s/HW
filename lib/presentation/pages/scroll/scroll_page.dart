import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/presentation/pages/common_widgets/widgets.dart';
import 'package:hw/root_bloc/bloc.dart';

import 'scroll_page_widgets.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

//Убого статичный фон на заднике...
class _ScrollPageState extends State<ScrollPage> {
  @override
  void didChangeDependencies() {
    context.read<RootBloc>().add(const PreloadDataEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;

    const double factorCommonPadding = 0.02;
    final double paddingCommon = heightScreen * factorCommonPadding;

    const double factorElementVerticalPadding = 0.009;
    final double padVerticalElement =
        heightScreen * factorElementVerticalPadding;

    const double factorElementHorizontalPadding = 0.02;
    final double padHorizontalElement =
        widthScreen * factorElementHorizontalPadding;

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
            child: BlocBuilder<RootBloc, RootState>(
              builder: (context, state) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    //Один из отступов - на список или на элемент надобно в
                    //билдер списка вывести, но какой он там - в гугле забанили,
                    //потому что время сильно утекает
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: padVerticalElement,
                        horizontal: padHorizontalElement,
                      ),
                      child: Book.fromModel(state.dataMovies![index]),
                    );
                  },
                  itemCount: 7,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
