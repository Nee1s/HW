import 'package:hw/domain/content_model.dart';

///для пущей красоты можно было бы запилить абстракты
///и от них здесь имплементироваться, но поскольку обертка
///всего одна заморчаиваться не стал

class InfoTransfer {
  const InfoTransfer({required this.link});

  final Object link;

  RecipeModel get getLinkModel => link as RecipeModel;
}
