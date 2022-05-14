import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/presentation/pages/common_widgets/widgets.dart';
import 'package:hw/root_bloc/bloc.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  void didChangeDependencies() {
    context.read<RootBloc>().add(const PreloadDataEvent());
    super.didChangeDependencies();
  }

  //Мелко местами, но оно есть

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;

    const double factorCommonPadding = 0.02;
    final double paddingCommon = heightScreen * factorCommonPadding;

    const double factorElementVerticalPadding = 0.009;
    final double padVerticalElement =
        heightScreen * factorElementVerticalPadding;

    const double factorElementHorizontalPadding = 0.05;
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
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //childAspectRatio: 26 / 37,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: padVerticalElement,
                        horizontal: padHorizontalElement,
                      ),
                      child: giveMeRandPolaroid(state.dataMovies![index]),
                    );
                  },
                  scrollDirection:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? Axis.vertical
                          : Axis.horizontal,
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
