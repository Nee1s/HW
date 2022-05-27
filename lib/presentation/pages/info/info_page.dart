import 'package:flutter/material.dart';
import 'package:hw/components/common_widgets/page_bars.dart';
import 'package:hw/components/wraps.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/presentation/pages/info/info_page_widgets.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    required this.linkModel,
    Key? key,
  }) : super(key: key);

  final InfoTransfer linkModel;

  static const String path = '/info';

  factory InfoPage.fromModel({required Object model, Key? key}) {
    final InfoTransfer _linkModel = InfoTransfer(link: model);
    return InfoPage(
      linkModel: _linkModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;

    const double factorCommonPadding = 0.02;
    final double paddingCommon = heightScreen * factorCommonPadding;

    return SafeArea(
      child: Scaffold(
        appBar: const CommonAppBar(title: 'HW Courses'),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(consts.scaffoldBackgrnd),
              fit: BoxFit.fill,
            ),
          ),
          foregroundDecoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(consts.gridBackgrnd),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(paddingCommon),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(consts.backgroundInfo),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 23,
                    child: MainContentInfo.fromModel(
                        model: linkModel.getLinkModel),
                  ),
                  const Spacer(flex: 11),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
