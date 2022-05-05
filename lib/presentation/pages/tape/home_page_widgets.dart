import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/domain/content_model.dart';
import 'package:hw/presentation/pages/tape/bloc/bloc.dart';

class FilmFrame extends StatelessWidget {
  const FilmFrame({required this.model, Key? key}) : super(key: key);

  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  //Проще передать ссылку на модель которая весит 8 байт
  //нежели вставлять каждое поле, под которое будет выделятся память
  //поскольку большинство полей будет простого типа

  final MovieCard model;

  factory FilmFrame.createByModel({
    required MovieCard model,
    Key? key,
  }) =>
      FilmFrame(model: model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              alignment: Alignment.center,
              foregroundDecoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/backgrounds/film.png'),
                    fit: BoxFit.fitWidth),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: consts.heightScreen * 0.0064,
                      right: consts.widthScreen * 0.111,
                      left: consts.widthScreen * 0.111),
                  child: Image.asset(
                    model.picture.isNotEmpty
                        ? model.picture
                        : consts.pathNoImage,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: consts.widthScreen * 0.185,
              right: consts.heightScreen * 0.093,
              child: Transform.rotate(
                  angle: -pi / 3.365,
                  child: SizedBox(
                    width: consts.widthScreen * 0.345,
                    height: consts.heightScreen * 0.109,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.5, right: 12.5, top: 7.5, bottom: 7.5),
                        child: Text(
                          '${model.title}\n${model.speech.toPrettyString()}',
                          textAlign: TextAlign.center,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          height: consts.heightScreen * 0.096,
          foregroundDecoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgrounds/divider.png'),
                fit: BoxFit.fitWidth),
          ),
        )
      ],
    );
  }
}

class FilterField extends StatelessWidget {
  final Lang? lang;
  final bool? withPoster;
  final String? search;

  const FilterField(
      {required this.lang,
      required this.withPoster,
      required this.search,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Lang> listNameRadio =
        Lang.values.where((element) => element != Lang.err).toList();
    final TextEditingController searchTransfer = TextEditingController();
    searchTransfer.text = search ?? '';

    return Column(
      children: [
        Row(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    left: consts.widthScreen * 0.0347,
                    right: consts.widthScreen * 0.0347),
                child: SizedBox(
                  width: consts.widthScreen - 30,
                  child: TextFormField(
                    controller: searchTransfer,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[а-яА-Я]')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: consts.widthScreen / 1.7,
                      child: CheckboxListTile(
                        value: withPoster ?? false,
                        onChanged: (value) => _redrawForm(context, lang, value),
                        title: const Text('С постером'),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: consts.widthScreen - 30,
                        child: Column(
                            children: List.generate(
                                listNameRadio.length,
                                ((index) => RadioListTile(
                                      value: listNameRadio[index],
                                      groupValue: lang ?? Lang.err,
                                      onChanged: (Lang? value) => lang != value
                                          ? _redrawForm(
                                              context, value, withPoster)
                                          : _redrawForm(
                                              context, Lang.err, withPoster),
                                      title: Text(listNameRadio[index]
                                          .toPrettyString()),
                                      toggleable: true, //- что-то сломалося
                                    )))),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () => _clickSearch(
                          context, lang, withPoster, searchTransfer.text),
                      child: const Text('Искать'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void _clickSearch(
      BuildContext context, Lang? _lang, bool? _poster, String? _search) {
    context.read<RootBloc>().add(FilterMovieEvent(
          search: _search,
          filterLang: _lang,
          filterWithPoster: _poster,
        ));
  }

  void _redrawForm(BuildContext context, Lang? _lang, bool? _poster) {
    context.read<RootBloc>().add(PaintFilterFieldEvent(
          radioBtnLang: _lang,
          checkBxWithPoster: _poster,
        ));
  }
}
