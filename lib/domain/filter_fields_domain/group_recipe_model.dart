class ViewSubCategory {
  ViewSubCategory({
    required this.tagName,
    required this.id,
    this.linkImage,
  });

  final String tagName;
  final String id;
  final String? linkImage;
}

class ViewCategory {
  ViewCategory({
    required this.categoryName,
    required this.linkIcon,
    required this.subcategories,
  });

  final List<ViewSubCategory> subcategories;
  final String categoryName;
  final String linkIcon;
}
