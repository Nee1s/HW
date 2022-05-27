import 'dart:math';

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

    const double factorCommonPadding = 0.02;
    final double paddingCommon = heightScreen * factorCommonPadding;

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
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(consts.backgroundInfo), fit: BoxFit.fill),
              ),
              child: Transform.rotate(
                angle: -10 * pi / 180,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 10,
                                child: SimplePolaroidFrame(
                                    picture: widget.picture)),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Наименование: ',
                                      style: ThemeFonts.generalNominativeStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Дата выхода: ',
                                      style: ThemeFonts.generalNominativeStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Оценка: ',
                                      style: ThemeFonts.generalNominativeStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Язык озвучивания: ',
                                      style: ThemeFonts.generalNominativeStyle,
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
      ),
    );
  }
}
