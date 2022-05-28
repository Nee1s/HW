class Ingredient {
  final String name;
  final double? quantity;
  final String? unit;
  final String? clarification;

  Ingredient({
    required this.name,
    this.quantity,
    this.unit,
    this.clarification,
  });

  String get titleInList {
    return name +
        (clarification?.isNotEmpty ?? false ? ' ($clarification)' : '') +
        (!(quantity?.isNaN ?? false) ? ' $_strQuantity' : '') +
        (unit?.isNotEmpty ?? false ? ' $unit' : '');
  }

  String get _strQuantity {
    final int wholePart = (quantity?.toInt() ?? 0);
    switch ((quantity?.toStringAsFixed(3).split('.').last ?? '0')) {
      case '333':
        return wholePart > 0 ? '$wholePart 1/3' : '1/3';
      case '666':
        return wholePart > 0 ? '$wholePart 2/3' : '2/3';
      case '500':
        return wholePart > 0 ? '$wholePart 1/2' : '1/2';
      case '250':
        return wholePart > 0 ? '$wholePart 1/4' : '1/4';
      case '750':
        return wholePart > 0 ? '$wholePart 3/4' : '3/4';
      case '125':
        return wholePart > 0 ? '$wholePart 1/8' : '1/8';
      case '375':
        return wholePart > 0 ? '$wholePart 3/8' : '3/8';
      case '625':
        return wholePart > 0 ? '$wholePart 5/8' : '5/8';
      case '875':
        return wholePart > 0 ? '$wholePart 7/8' : '7/8';
      case '0':
      default:
        return wholePart > 0 ? wholePart.toString() : '';
    }
  }
}
