import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/pages/tape/bloc/bloc.dart';

import 'home_page_widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // late final List<MovieCard> listFilm;
  // late List<MovieCard> filteredListFilm;

  // @override                                  //Задание говорит - делай инит стейт с записью переменных -
  // void initState() {                         //пример как бы оно было, без блока
  //   super.initState();
  //   listFilm = generateListFilms();
  //   filteredListFilm = List.from(listFilm);
  // }

  @override
  void didChangeDependencies() {
    context.read<RootBloc>().add(const PreloadDataEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootBloc>(
      lazy: false,
      create: (_) => RootBloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('HW Films'),
            centerTitle: true,
            leading: const Icon(Icons.voice_chat),
          ),
          body: BlocBuilder<RootBloc, RootState>(builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilterField(
                    lang: state.radioBLang,
                    withPoster: state.chkBxPoster,
                    search: state.search,
                  ),
                  const Divider(
                    height: 5.0,
                    thickness: 2.0,
                  ),
                  Column(
                    //Без блока было бы так
                    //children: List.generate(
                    //            filteredListFilm.length,
                    //            (index) => FilmFrame.createByModel(
                    //                          key: ValueKey<int>( int.parse(filteredListFilm[index].id) ),
                    //                          model: filteredListFilm[index])),
                    children: List.generate(
                        state.dataMovies?.length ?? 0,
                        (index) => FilmFrame.createByModel(
                            key: ValueKey<int>(int.parse(state
                                .dataMovies![index]
                                .id)), //сейчас данные бил руками -
                            model: state.dataMovies![
                                index])), //уверен, что нуля нигде не будет
                    //когда данные пойдут из сети, буду не уверен
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
