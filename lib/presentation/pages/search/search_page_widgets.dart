import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hw/domain/content_model.dart';
import 'package:hw/presentation/pages/search/bloc/search_bloc.dart';
import 'package:hw/root_bloc/bloc.dart';

class FilterField extends StatefulWidget {
  const FilterField({Key? key}) : super(key: key);

  @override
  State<FilterField> createState() => _FilterFieldState();
}

class _FilterFieldState extends State<FilterField> {
  final TextEditingController searchTransfer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Lang> listNameRadio =
        Lang.values.where((element) => element != Lang.err).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final double _width = constraints.maxWidth;

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: _width - 10.0,
                          ),
                          child: TextField(
                            controller: searchTransfer,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[а-яА-Я]')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          BlocBuilder<SearchBloc, SearchState>(
                              buildWhen: (oldS, newS) =>
                                  oldS.chkBxPoster != newS.chkBxPoster,
                              builder: (context, state) {
                                return ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: _width - 10.0,
                                  ),
                                  child: CheckboxListTile(
                                    value: state.chkBxPoster ?? false,
                                    onChanged: (value) {
                                      context.read<SearchBloc>().add(
                                            RepaintFilterEvent(
                                              filterWithPoster: value,
                                            ),
                                          );
                                    },
                                    title: const Text('С картинкой'),
                                  ),
                                );
                              }),
                          BlocBuilder<SearchBloc, SearchState>(
                              buildWhen: (oldS, newS) =>
                                  oldS.radioBLang != newS.radioBLang,
                              builder: (context, state) {
                                return ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: _width - 10.0,
                                  ),
                                  child: Column(
                                    children: List.generate(
                                      listNameRadio.length,
                                      ((index) => RadioListTile<Lang>(
                                            value: listNameRadio[index],
                                            groupValue: state.radioBLang,
                                            onChanged: (Lang? value) {
                                              context.read<SearchBloc>().add(
                                                    RepaintFilterEvent(
                                                      filterLang: value,
                                                    ),
                                                  );
                                            },
                                            title: Text(listNameRadio[index]
                                                .toPrettyString()),
                                            toggleable:
                                                true, //- что-то сломалося
                                          )),
                                    ),
                                  ),
                                );
                              }),
                          BlocBuilder<SearchBloc, SearchState>(
                            buildWhen: (oldS, newS) => false,
                            builder: (context, state) {
                              return TextButton(
                                onPressed: () => context.read<RootBloc>().add(
                                      FilterMovieEvent(
                                        search: searchTransfer.text,
                                        filterLang: state.radioBLang,
                                        filterWithPoster: state.chkBxPoster,
                                      ),
                                    ),
                                child: const Text('Искать'),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    searchTransfer.dispose();
    super.dispose();
  }
}
