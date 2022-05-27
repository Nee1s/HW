import 'package:hw/data/dtos/categories/yummly_json_category_view.dart';
import 'package:hw/domain/filter_fields_domain/group_recipe_model.dart';

extension CategoryDTOToDomain on CategoryDTO {
  List<ViewCategory>? toPartDomain() {
    final List<ViewCategory> tempListCategory;

    if (categories?.isNotEmpty ?? false) {
      final ViewCategory othersCategory = ViewCategory(
        subcategories: <ViewSubCategory>[],
        categoryName: 'Others',
        linkIcon: '',
      );
      tempListCategory = <ViewCategory>[];
      for (var oneCategoryDTO in categories!) {
        if (oneCategoryDTO.headCategory?.listSubCategory?.isNotEmpty ?? false) {
          tempListCategory.add(oneCategoryDTO._toDomainAsCategory());
        } else {
          othersCategory.subcategories
              .add(oneCategoryDTO._toDomainAsSubCategory());
        }
      }
      tempListCategory.add(othersCategory);
    } else {
      tempListCategory = [];
    }

    return tempListCategory;
  }
}

extension _CategoryDataDTOToDomain on CategoryItemsDTO {
  ViewCategory _toDomainAsCategory() {
    return ViewCategory(
      subcategories: headCategory!._toDomain(),
      categoryName: headCategory!.headCategoryName ?? '',
      linkIcon: headCategory!.headCategoryLinkIcon ?? '',
    );
  }

  ViewSubCategory _toDomainAsSubCategory() {
    return ViewSubCategory(
      tagName: headCategory!.headCategoryName ?? '',
      id: headCategory!.headCategorySearchId ?? '',
      linkImage: headCategory!.headCategoryLinkImage ?? '',
    );
  }
}

extension _SubcategoryDataDTOToDomain on HeadCategoryDTO {
  List<ViewSubCategory> _toDomain() {
    return List.generate(
      listSubCategory!.length,
      (index) => ViewSubCategory(
        tagName:
            listSubCategory![index].subCategoryItems?.nameSubCategory ?? '',
        id: listSubCategory![index].subCategoryItems?.subCategorySearchId ?? '',
        linkImage:
            listSubCategory![index].subCategoryItems?.subCategoryLinkImage ??
                '',
      ),
    );
  }
}
