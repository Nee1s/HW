import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hw/bloc/error_bloc/error_bloc.dart';
import 'package:hw/bloc/root_bloc/bloc.dart';
import 'package:hw/components/wraps.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/domain/content_model.dart';

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

        final AutoSizeGroup titleSize = AutoSizeGroup();

        return BlocBuilder<RootBloc, RootState>(
          buildWhen: (oldS, newS) => oldS.dataRecipes != newS.dataRecipes,
          builder: (context, state) {
            return FutureBuilder(
              future: state.dataRecipes,
              builder: (BuildContext context,
                  AsyncSnapshot<RecipesContentModel?> loadingData) {
                if (loadingData.connectionState != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (loadingData.hasData) {
                    if ((loadingData.data?.yummlyRecipes?.isNotEmpty ??
                        false)) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: padVerticalElement,
                              horizontal: padHorizontalElement,
                            ),
                            child: PolaroidFrame.fromModel(
                              model: loadingData.data!.yummlyRecipes![index],
                              titleSize: titleSize,
                              key: ValueKey(index.toString()),
                            ),
                          );
                        },
                        scrollDirection: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? Axis.vertical
                            : Axis.horizontal,
                        itemCount: loadingData.data?.yummlyRecipes?.length ?? 0,
                        shrinkWrap: true,
                      );
                    } else {
                      context.read<ErrorBloc>().add(const EmptyDataEvent());
                      return const SizedBox.shrink();
                    }
                  } else {
                    context.read<ErrorBloc>().add(const NoDataEvent());
                    return const SizedBox.shrink();
                  }
                }
              },
            );
          },
        );
      },
    );
  }
}

class PolaroidFrame extends StatelessWidget {
  const PolaroidFrame(
      {required this.title,
      required this.picture,
      required this.link,
      required this.titleSize,
      Key? key})
      : super(key: key);

  final String title;
  final String picture;
  final RecipeModel link;
  final AutoSizeGroup titleSize;

  factory PolaroidFrame.fromModel({
    required RecipeModel model,
    required AutoSizeGroup titleSize,
    Key? key,
  }) {
    return PolaroidFrame(
      title: model.title,
      picture: model.imageLink,
      titleSize: titleSize,
      link: model,
      key: key,
    );
  }

  double get _randomRotateAngle {
    const int maxAngle = 100; //угол * 10
    const int minAngle = 40; //угол * 10

    final double sign = (Random().nextInt(4) - 2.5).sign;
    final double pickerAngle =
        (Random().nextInt(maxAngle - minAngle) + minAngle) / 10;
    return sign * pickerAngle * pi / 180.0;
  }

  @override
  Widget build(BuildContext context) {
    final int picker = Random().nextInt(3);

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Transform.rotate(
        angle: _randomRotateAngle,
        child: AspectRatio(
          aspectRatio: 5 / 6,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double widthBox = constraints.maxWidth;

              const double factorBtmPadding = 0.055;
              final double commonBottomPadding = widthBox * factorBtmPadding;

              const double factorSideImgPadding = 0.047;
              final double sideImgPadding = factorSideImgPadding * widthBox;

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/info',
                    arguments: InfoTransfer(link: link),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      foregroundDecoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(consts.polaroidsTitle[picker]),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 4 * commonBottomPadding,
                            right: sideImgPadding,
                            left: sideImgPadding,
                          ),
                          child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            color: Colors.black,
                            child: (picture.isNotEmpty)
                                ? Image.network(picture)
                                : Image.asset(consts.pathNoImage),
                          )),
                    ),
                    Column(
                      children: [
                        const Spacer(flex: 15),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            ///Такие отступы были изначально заложены при рисовании рамки
                            padding: EdgeInsets.symmetric(
                              horizontal: 3 * commonBottomPadding,
                              vertical: commonBottomPadding,
                            ),
                            child: Center(
                              child: AutoSizeText(
                                title,
                                textAlign: TextAlign.center,
                                minFontSize: 8,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                group: titleSize,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
