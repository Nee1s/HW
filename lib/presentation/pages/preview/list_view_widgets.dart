import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hw/bloc/error_bloc/error_bloc.dart';
import 'package:hw/bloc/root_bloc/bloc.dart';
import 'package:hw/components/common_widgets/widgets.dart';
import 'package:hw/components/wraps.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/domain/content_model.dart';

class ScrollListView extends StatefulWidget {
  const ScrollListView({Key? key}) : super(key: key);

  @override
  State<ScrollListView> createState() => _ScrollListViewState();
}

class _ScrollListViewState extends State<ScrollListView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double widthScreen = constraints.maxWidth;
        final double heightScreen = constraints.maxHeight;

        const double factorElementVerticalPadding = 0.009;
        final double padVerticalElement =
            heightScreen * factorElementVerticalPadding;

        const double factorElementHorizontalPadding = 0.05;
        final double padHorizontalElement =
            widthScreen * factorElementHorizontalPadding;

        final AutoSizeGroup title = AutoSizeGroup();
        final AutoSizeGroup desc = AutoSizeGroup();

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
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: padVerticalElement,
                              horizontal: padHorizontalElement,
                            ),
                            child: Letter.fromModel(
                              model: loadingData.data!.yummlyRecipes![index],
                              titleSize: title,
                              descSize: desc,
                              key: ValueKey(index.toString()),
                            ),
                          );
                        },
                        itemCount: loadingData.data?.yummlyRecipes?.length ?? 0,
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

class Letter extends StatelessWidget {
  const Letter({
    required this.title,
    required this.ratting,
    required this.pictureLink,
    required this.link,
    required this.author,
    required this.cookTime,
    required this.titleSize,
    required this.descSize,
    Key? key,
  }) : super(key: key);

  final String title;
  final String pictureLink;
  final double ratting;
  final String cookTime;
  final String author;
  final RecipeModel link;
  final AutoSizeGroup titleSize;
  final AutoSizeGroup descSize;

  factory Letter.fromModel({
    required RecipeModel model,
    required AutoSizeGroup titleSize,
    required AutoSizeGroup descSize,
    Key? key,
  }) {
    return Letter(
      title: model.title,
      pictureLink: model.imageLink,
      ratting: model.rating ?? 0.0,
      cookTime: model.totalTime ?? '',
      author: model.authorName ?? '',
      titleSize: titleSize,
      descSize: descSize,
      link: model,
      key: key,
    );
  }

  //Это колдунство возможно пригодится в будущем
  //оно разбивает строку текста на две относительно равномерных
  //строки в разрезе конкретного поля описания, часть описания
  //на одной стороне страницы "книги", часть описания на другой странице
  //Это не совсем полный вариант.
  // Map<parts, String> divideDescription() {
  //   final int? _dividePosition;
  //   final int _idxHalfDescription =
  //       description.indexOf(' ', (description.length / 2).floor());
  //
  //   final int calculate =
  //       description.length > 120 ? description.indexOf(' ', 120) : -1;
  //   _dividePosition = calculate > 0 && description.length - calculate > 40
  //       ? calculate
  //       : _idxHalfDescription > 0
  //           ? _idxHalfDescription
  //           : description.length;
  //   try {
  //     return {
  //       parts.partOne: description.substring(0, _dividePosition),
  //       parts.partTwo: description.substring(_dividePosition + 1),
  //     };
  //   } on RangeError {
  //     return {
  //       parts.partOne: description,
  //       parts.partTwo: '',
  //     };
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //final Map<parts, String> _description = divideDescription();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double widthBox = constraints.maxWidth;

        const double factorPadContent = 0.09;
        final double commonPadding = widthBox * factorPadContent;

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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(consts.letterBackgrnd),
                    fit: BoxFit.fill,
                  ),
                ),
                foregroundDecoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(consts.letterRopeForeground),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: commonPadding),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.only(top: commonPadding),
                          child: SimplePolaroidFrame(
                            picture: pictureLink,
                            isRotateLeft: true,
                          ),
                        ),
                      ),
                      const Spacer(flex: 5),
                      Expanded(
                        flex: 10,
                        child: ListLetterInfo(
                          cookTime: cookTime,
                          author: author,
                          title: title,
                          titleSize: titleSize,
                          descSize: descSize,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ListLetterInfo extends StatelessWidget {
  const ListLetterInfo(
      {required this.title,
      required this.author,
      required this.cookTime,
      required this.titleSize,
      required this.descSize,
      Key? key})
      : super(key: key);

  final String title;
  final String cookTime;
  final String author;
  final AutoSizeGroup titleSize;
  final AutoSizeGroup descSize;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double widthBox = constraints.maxWidth;

          const double factorPadContent = 0.13;
          final double commonPadding =
              (widthBox * factorPadContent).truncateToDouble();

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(consts.letterInfoListBackgrnd),
                fit: BoxFit.fill,
              ),
            ),
            child: Transform.rotate(
              angle: 8.0 * pi / 180,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: commonPadding,
                  horizontal: commonPadding,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 8,
                      child: AutoSizeText(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 6,
                        minFontSize: 6,
                        group: titleSize,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        'Time: $cookTime',
                        minFontSize: 6,
                        overflow: TextOverflow.ellipsis,
                        group: descSize,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: AutoSizeText(
                        author,
                        maxLines: 2,
                        minFontSize: 6,
                        group: descSize,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
