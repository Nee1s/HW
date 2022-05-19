class ViewSubCategory {
  ViewSubCategory({
    required this.displayName,
    required this.id,
    this.imageUrl,
  });

  final String displayName;
  final String id;
  final String? imageUrl;
}

class ViewCategory {
  ViewCategory({
    required this.displayName,
    required this.iconUrl,
    required this.items,
  });

  final List<ViewSubCategory> items;
  final String displayName;
  final String iconUrl;
}
