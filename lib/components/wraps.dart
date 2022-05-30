import 'package:hw/domain/content_model.dart';
import 'package:hw/main.dart';
import 'package:hw/presentation/pages/preview/grid_view_widgets.dart';

///Все под одну гребенку получается... но впринципипе,
///относительно для текущего варианта...
class InfoTransfer implements TransferModel, TransferDetail {
  const InfoTransfer({required this.link});

  final Object link;

  @override
  RecipeModel get getLinkModel => link as RecipeModel;
}
