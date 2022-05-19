import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/domain/content_model.dart';
import 'package:hw/presentation/common_widgets/body_page_widgets.dart';
import 'package:hw/presentation/themes/text_styles.dart';
import 'package:hw/root_bloc/bloc.dart';
import 'package:hw/utilities/wraps.dart';

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

        return BlocBuilder<RootBloc, RootState>(
          builder: (context, state) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: padVerticalElement,
                horizontal: padHorizontalElement,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Book.fromModel(state.dataMovies!.yummlyRecipes[index]);
              },
              itemCount: 7,
            );
          },
        );
      },
    );
  }
}

class Book extends StatelessWidget {
  const Book({
    required this.title,
    required this.description,
    required this.language,
    required this.voteAverage,
    required this.releaseDate,
    required this.pictureLink,
    required this.link,
    Key? key,
  }) : super(key: key);

  final String title;
  final String pictureLink;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String language;
  final MovieModel link;

  factory Book.fromModel(MovieModel model) {
    return Book(
      title: model.title,
      pictureLink: model.picture,
      voteAverage: model.voteAverage,
      releaseDate: model.releaseDate,
      description: model.description,
      language: model.language,
      link: model,
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

    return AspectRatio(
      aspectRatio: 31 / 19,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double widthBox = constraints.maxWidth;
          final double heightBox = constraints.maxHeight;

          const double factorPadVertical = 0.08;
          const double factorPadHorizontal = 0.06;

          final double padVertical = heightBox * factorPadVertical;
          final double padHorizontal = widthBox * factorPadHorizontal;

          const double factorTxtScale = 13.1;
          final double minFontSize =
              (factorTxtScale * heightBox / widthBox).floor().toDouble();

          return Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/info',
                  arguments: InfoTransfer(model: link),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(consts.bookBackground),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: padHorizontal,
                      vertical: padVertical,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Center(
                                  child:
                                      SimplePolaroidFrame(picture: pictureLink),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Center(
                                    child: AutoSizeText(
                                      title,
                                      style: ThemeFonts.generalDescriptiveStyle,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      minFontSize: minFontSize,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    '$releaseDate г.',
                                    style: ThemeFonts.generalDescriptiveStyle,
                                    maxLines: 1,
                                    minFontSize: minFontSize,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    'Оценка: $voteAverage',
                                    style: ThemeFonts.generalDescriptiveStyle,
                                    maxLines: 1,
                                    minFontSize: minFontSize,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    'Варианты озвучивания:\n$language',
                                    style: ThemeFonts.generalDescriptiveStyle,
                                    maxLines: 2,
                                    minFontSize: minFontSize,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Гугл сказал так нормально делать, но я не уверен
                        //виджет Wrap, вроде не работает с Expanded, по понятным причинам
                        const Expanded(
                          flex: 2,
                          child: SizedBox.shrink(),
                        ),
                        //Можно было поиграться с вырваниваниями, что бы в колонку не оборачивать текст
                        //но время уже совсем как песок
                        Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              AutoSizeText(
                                description,
                                style: ThemeFonts.generalDescriptiveStyle,
                                maxLines: 11,
                                minFontSize: 8,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
