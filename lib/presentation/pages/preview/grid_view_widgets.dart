import 'package:flutter/material.dart';
import 'package:hw/presentation/common_widgets/widgets.dart';
import 'package:hw/root_bloc/bloc.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double widthScreen = constraints.maxWidth;
        final double heightScreen = constraints.maxHeight;

        const double factorElementVerticalPadding = 0.012;
        final double padVerticalElement =
            heightScreen * factorElementVerticalPadding;

        const double factorElementHorizontalPadding = 0.055;
        final double padHorizontalElement =
            widthScreen * factorElementHorizontalPadding;
        //обернут в widget CatalogView
        return BlocBuilder<RootBloc, RootState>(
          builder: (context, state) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 5 / 7,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: padVerticalElement,
                    horizontal: padHorizontalElement,
                  ),
                  child:
                      giveMeRandPolaroid(state.dataMovies!.localMovies[index]),
                );
              },
              scrollDirection:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? Axis.vertical
                      : Axis.horizontal,
              itemCount: 7,
              shrinkWrap: true,
            );
          },
        );
      },
    );
  }
}
