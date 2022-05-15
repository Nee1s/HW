import 'package:flutter/material.dart';
import 'package:hw/domain/content_model.dart';

class InfoFilmPage extends StatefulWidget {
  const InfoFilmPage({required this.filmContent, Key? key}) : super(key: key);
  final MovieModel filmContent;

  @override
  State<InfoFilmPage> createState() => _InfoFilmPageState();
}

class _InfoFilmPageState extends State<InfoFilmPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void didChangeDependencies() {
    _controller = AnimationController(vsync: this);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthSrc = MediaQuery.of(context).size.width;
    final double heightSrc = MediaQuery.of(context).size.height;

    return SafeArea(
      minimum:
          const EdgeInsets.only(top: 4.0, left: 10.0, right: 10.0, bottom: 5.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HW Films'),
          centerTitle: true,
        ),
        //body:,
      ),
    );
  }
}
