import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/domain/content_model.dart';
import 'package:hw/presentation/common_widgets/body_page_widgets.dart';
import 'package:hw/presentation/common_widgets/page_bars.dart';
import 'package:hw/presentation/themes/themes_films_app.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({
    Key? key,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.releaseDate,
    required this.description,
    required this.speech,
  }) : super(key: key);

  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final Lang speech;

  static const String path = '/info';

  factory InfoPage.fromModel({required MovieModel model, Key? key}) {
    return InfoPage(
      title: model.title,
      picture: model.picture,
      voteAverage: model.voteAverage,
      releaseDate: model.releaseDate,
      speech: model.speech,
      description: model.description,
    );
  }

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;

    const double factorVerticalPadding = 0.85;
    const double factorHorizontalPadding = 0.1;

    final double paddingVertical = heightScreen * factorVerticalPadding;
    final double paddingHorizontal = widthScreen * factorHorizontalPadding;

    return SafeArea(
      child: Scaffold(
        appBar: const CommonAppBar(title: 'HW Courses'),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(consts.scaffoldBackground), fit: BoxFit.fill),
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(consts.backgroundInfo), fit: BoxFit.fill),
            ),
            child: Transform.rotate(
              angle: 4.5 * pi / 180,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: paddingVertical,
                  horizontal: paddingHorizontal,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 9,
                              child:
                                  SimplePolaroidFrame(picture: widget.picture)),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Expanded(
                                  child: AutoSizeText(
                                    'Наименование: ',
                                    style: ThemeFonts.generalNominativeStyle,
                                    minFontSize: 8,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    'Дата выхода: ',
                                    style: ThemeFonts.generalNominativeStyle,
                                    minFontSize: 8,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    'Оценка: ',
                                    style: ThemeFonts.generalNominativeStyle,
                                    minFontSize: 8,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    'Язык озвучивания: ',
                                    style: ThemeFonts.generalNominativeStyle,
                                    minFontSize: 8,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.title,
                                    style: ThemeFonts.generalDescriptiveStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '$widget.releaseDate г.',
                                    style: ThemeFonts.generalDescriptiveStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.voteAverage.toString(),
                                    style: ThemeFonts.generalDescriptiveStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.speech.toPrettyString(),
                                    style: ThemeFonts.generalDescriptiveStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 13,
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.center,
                        style: ThemeFonts.generalDescriptiveStyle,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
