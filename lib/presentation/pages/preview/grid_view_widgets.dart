import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hw/bloc/error_bloc/error_bloc.dart';
import 'package:hw/bloc/root_bloc/bloc.dart';
import 'package:hw/components/wraps.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/domain/content_model.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({
    required this.isDataCaching,
    required this.typeList,
    Key? key,
  }) : super(key: key);

  final bool isDataCaching;
  final Mode typeList;

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
                          //по хорошему выносить в абстракт и составлять di надо, но время
                          //да и в целом везде затычки появились и код стал вцелом с душком
                          final RecipeModel? elementList =
                              widget.typeList == Mode.net
                                  ? (loadingData.data!.yummlyRecipes?[index])
                                  : state.savedRecipes?[index];

                          return elementList != null
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: padVerticalElement,
                                    horizontal: padHorizontalElement,
                                  ),
                                  child: PolaroidFrame.fromModel(
                                    model: elementList,
                                    titleSize: titleSize,
                                    isDataCaching: widget.isDataCaching,
                                    onTapToSaveReact:
                                        reactionOnTapSave(elementList),
                                    onTapToSaveGetAnswer: answerOnTapToSave(
                                      linkModel: elementList,
                                      searchInList: state.savedRecipes ?? [],
                                    ),
                                    onTapWidget:
                                        reactionOnTapWidget(elementList),
                                    key: ValueKey(index.toString()),
                                  ),
                                )
                              : const SizedBox.shrink();
                        },
                        scrollDirection: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? Axis.vertical
                            : Axis.horizontal,
                        itemCount: (widget.typeList == Mode.saved
                                ? state.savedRecipes?.length
                                : loadingData.data?.yummlyRecipes?.length) ??
                            0,
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

  VoidCallback reactionOnTapWidget(RecipeModel link) {
    return () => Navigator.of(context).pushNamed(
          '/info',
          arguments: InfoTransfer(link: link),
        );
  }

  VoidCallback reactionOnTapSave(RecipeModel linkModel) {
    return () => context
        .read<RootBloc>()
        .add(SavingRecipeIsClickedEvent(clickedRecipe: linkModel));
  }

  bool Function() answerOnTapToSave(
      {required RecipeModel linkModel,
      required List<RecipeModel> searchInList}) {
    return () =>
        searchInList.firstWhereOrNull(
            (recipe) => recipe.reviewId == linkModel.reviewId) !=
        null;
  }
}

enum Mode { saved, net }

class PolaroidFrame extends StatelessWidget {
  const PolaroidFrame(
      {required this.title,
      required this.picture,
      required this.onTapToOpenDetail,
      required this.onTapToSaveGetAnswer,
      required this.onTapToSaveReact,
      required this.titleSize,
      required this.isDataCaching,
      Key? key})
      : super(key: key);

  final String title;
  final String picture;
  final VoidCallback onTapToOpenDetail;
  final VoidCallback onTapToSaveReact;
  final bool Function() onTapToSaveGetAnswer;
  final AutoSizeGroup titleSize;
  final bool isDataCaching;

  factory PolaroidFrame.fromModel({
    required RecipeModel model,
    required AutoSizeGroup titleSize,
    required bool Function() onTapToSaveGetAnswer,
    required VoidCallback onTapToSaveReact,
    required VoidCallback onTapWidget,
    required bool isDataCaching,
    Key? key,
  }) {
    return PolaroidFrame(
      title: model.title,
      picture: model.imageLink,
      titleSize: titleSize,
      onTapToOpenDetail: onTapWidget,
      onTapToSaveGetAnswer: onTapToSaveGetAnswer,
      onTapToSaveReact: onTapToSaveReact,
      isDataCaching: isDataCaching,
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

              return Stack(
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
                      child: GestureDetector(
                        onTap: onTapToOpenDetail,
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          color: Colors.black,
                          child: (picture.isNotEmpty)
                              ? isDataCaching
                                  ? CachedNetworkImage(
                                      imageUrl: picture,
                                      cacheManager:
                                          consts.AppPictures.pictureCache,
                                    )
                                  : Image.network(picture)
                              : Image.asset(consts.pathNoImage),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 15), //15
                      Expanded(
                        flex: 4,
                        child: Padding(
                          ///Такие отступы были изначально заложены при рисовании рамки
                          padding: EdgeInsets.symmetric(
                            //horizontal: 3 * commonBottomPadding,
                            vertical: commonBottomPadding,
                          ),
                          child: BottomRowPolaroid(
                            title: title,
                            size: titleSize,
                            answer: onTapToSaveGetAnswer,
                            click: onTapToSaveReact,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class BottomRowPolaroid extends StatefulWidget {
  const BottomRowPolaroid({
    required this.title,
    required this.size,
    required this.answer,
    required this.click,
    Key? key,
  }) : super(key: key);

  final String title;
  final AutoSizeGroup size;
  final VoidCallback click;
  final bool Function() answer;

  @override
  State<BottomRowPolaroid> createState() => _BottomRowPolaroidState();
}

class _BottomRowPolaroidState extends State<BottomRowPolaroid> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      buildWhen: (oldS, newS) => oldS.savedRecipes != newS.savedRecipes,
      builder: (context, state) => GestureDetector(
        onTap: widget.click,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: widget.answer.call()
                  ? const Icon(
                      Icons.bookmark,
                      color: Colors.blueGrey,
                    )
                  : const Icon(
                      Icons.bookmark_border_outlined,
                      color: Colors.pinkAccent,
                    ),
            ),
            Expanded(
              flex: 14,
              child: AutoSizeText(
                widget.title,
                textAlign: TextAlign.center,
                minFontSize: 8,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                group: widget.size,
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
