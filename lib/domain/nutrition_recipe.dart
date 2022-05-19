class Nutrient {
  Nutrient({
    required this.element,
    required this.quantity,
    required this.unitAbbreviation,
  });

  final FoodElement element;
  final double quantity;
  final String unitAbbreviation;
}

enum FoodElement {
  k, //кальций
  na, //натрий
  chol, //холестерол
  fatrn, //трансжиры
  fasat, //насыщенные жиры
  carb, //углеводы
  fiber, //клетчетка
  prot, //протеин
  vitC, //витамин C
  ca, //кальций
  fe, //железо
  sugar, //сахар
  enrgKcal, //энергетическая ценность
  fat, //жиры(всего)
  vitA, //витамин А
  err,
}

extension ConvertNutritionToStr on FoodElement {
  String toPrettyString() {
    switch (this) {
      case FoodElement.k:
        return 'Potassium';
      case FoodElement.na:
        return 'Sodium';
      case FoodElement.chol:
        return 'Cholesterol';
      case FoodElement.fatrn:
        return 'Trans fatty acids';
      case FoodElement.fasat:
        return 'Saturated fatty acids';
      case FoodElement.carb:
        return 'Carbohydrate';
      case FoodElement.fiber:
        return 'Fiber';
      case FoodElement.prot:
        return 'Protein';
      case FoodElement.vitC:
        return 'Vitamin C';
      case FoodElement.ca:
        return 'Calcium';
      case FoodElement.fe:
        return 'Iron';
      case FoodElement.sugar:
        return 'Sugars';
      case FoodElement.enrgKcal:
        return 'Energy';
      case FoodElement.fat:
        return 'Total lipid (fat)';
      case FoodElement.vitA:
        return 'Vitamin A';
      default:
        return "Undefined element";
    }
  }

  static FoodElement createFromStr(String code) {
    switch (code) {
      case 'K':
        return FoodElement.k;
      case 'NA':
        return FoodElement.na;
      case 'CHOLE':
        return FoodElement.chol;
      case 'FATRN':
        return FoodElement.fatrn;
      case 'FASAT':
        return FoodElement.fasat;
      case 'CHOCDF':
        return FoodElement.carb;
      case 'FIBTG':
        return FoodElement.fiber;
      case 'PROCNT':
        return FoodElement.prot;
      case 'VITC':
        return FoodElement.vitC;
      case 'CA':
        return FoodElement.ca;
      case 'FE':
        return FoodElement.fe;
      case 'SUGAR':
        return FoodElement.sugar;
      case 'ENERC_KCAL':
        return FoodElement.enrgKcal;
      case 'FAT':
        return FoodElement.fat;
      case 'VITA_IU':
        return FoodElement.vitA;
      default:
        return FoodElement.err;
    }
  }
}
