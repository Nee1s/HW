import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hw/components/common_widgets/widgets.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/domain/content_model.dart';
import 'package:hw/presentation/themes/text_styles.dart';

class MainContentInfo extends StatelessWidget {
  const MainContentInfo(
      {required this.title,
      required this.imageLink,
      required this.sourceRecipeLink,
      required this.authorName,
      required this.description,
      required this.tags,
      required this.totalTime,
      required this.rating,
      required this.reviewId,
      required this.ingredients,
      required this.nutrition,
      Key? key})
      : super(key: key);

  final String title;
  final String imageLink;
  final String sourceRecipeLink;
  final String authorName;
  final String description;
  final List<SearchTag> tags;
  final String totalTime;
  final double rating;
  final String reviewId;
  final List<Ingredient> ingredients;
  final List<Nutrient> nutrition;

  factory MainContentInfo.fromModel({required RecipeModel model}) {
    return MainContentInfo(
      title: model.title,
      imageLink: model.imageLink,
      sourceRecipeLink: model.sourceRecipeLink ?? '',
      authorName: model.authorName ?? '',
      description: model.description ?? '',
      tags: model.tags,
      totalTime: model.totalTime ?? '',
      rating: model.rating ?? 0.0,
      reviewId: model.reviewId ?? '',
      ingredients: model.ingredients,
      nutrition: model.nutrition,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        final double widthBox = constrains.maxWidth;
        final double heightBox = constrains.maxHeight;

        const double factorSidePaddingMainText = 0.076;
        final double sidePaddingMainText = widthBox * factorSidePaddingMainText;

        const double factorVerticalPaddingMainText = 0.07;
        final double verticalPaddingMainText =
            heightBox * factorVerticalPaddingMainText;

        const double factorSidePaddingSubRow = 0.11;
        final double sidePaddingSubRow = widthBox * factorSidePaddingSubRow;

        const double factorSidePaddingSubText = 0.045;
        final double sidePaddingSubText = widthBox * factorSidePaddingSubText;

        const double factorTopPaddingSubText = 0.02;
        final double topPaddingSubText = heightBox * factorTopPaddingSubText;

        final AutoSizeGroup ingredientsGroup = AutoSizeGroup();
        final AutoSizeGroup nutrientsGroup = AutoSizeGroup();
        final AutoSizeGroup tagsGroup = AutoSizeGroup();
        final AutoSizeGroup rightPageGroup = AutoSizeGroup();

        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(consts.paperInfoBackgrnd),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 13,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: sidePaddingMainText,
                    vertical: verticalPaddingMainText,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 19,
                        child: Column(
                          children: [
                            const Expanded(
                              flex: 2,
                              child: AutoSizeText(
                                'Ingredients',
                                style: ThemeFonts.generalNominativeStyle,
                                maxLines: 1,
                                minFontSize: 10,
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  return AutoSizeText(
                                    '${index + 1}. ${ingredients[index].titleInList}',
                                    maxLines: 2,
                                    style: ThemeFonts.generalDescriptiveStyle,
                                    group: ingredientsGroup,
                                  );
                                },
                                itemCount: ingredients.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(flex: 5),
                      Expanded(
                        flex: 19,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Center(
                                child: AutoSizeText(
                                  title,
                                  maxLines: 3,
                                  style: ThemeFonts.generalExpositiveStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: TagButton.fromTagModel(
                                        tag: tags[index],
                                        textSize: tagsGroup,
                                      ),
                                    );
                                  },
                                  itemCount: tags.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Author : $authorName',
                                  maxLines: 2,
                                  style: ThemeFonts.generalExpositiveStyle,
                                  overflow: TextOverflow.ellipsis,
                                  group: rightPageGroup,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Time : $totalTime',
                                  style: ThemeFonts.generalExpositiveStyle,
                                  overflow: TextOverflow.ellipsis,
                                  group: rightPageGroup,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  'Rating : $rating'.toString(),
                                  style: ThemeFonts.generalExpositiveStyle,
                                  overflow: TextOverflow.ellipsis,
                                  group: rightPageGroup,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: AutoSizeText(
                                'Description:\n${description.isNotEmpty ? description : 'Unfortunately there is nothing'}',
                                maxLines: 5,
                                minFontSize: 8,
                                style: ThemeFonts.generalExpositiveStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: sidePaddingSubRow,
                      right: sidePaddingSubRow * 0.3,
                      bottom: sidePaddingSubRow * 0.7),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Transform.rotate(
                          angle: -8.0 * pi / 180,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: sidePaddingSubText,
                              right: sidePaddingSubText,
                              top: topPaddingSubText,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return AutoSizeText(
                                        nutrition[index].viewInList,
                                        maxLines: 1,
                                        minFontSize: 6,
                                        style:
                                            ThemeFonts.generalExpositiveStyle,
                                        group: nutrientsGroup,
                                      );
                                    },
                                    itemCount: nutrition.length,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 6,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SimplePolaroidFrame(picture: imageLink),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TagButton extends StatelessWidget {
  const TagButton({
    required this.searchId,
    required this.nameTag,
    required this.textSize,
    Key? key,
  }) : super(key: key);

  final String nameTag;
  final String searchId;
  final AutoSizeGroup textSize;

  factory TagButton.fromTagModel({
    required SearchTag tag,
    required AutoSizeGroup textSize,
  }) {
    return TagButton(
      searchId: tag.link,
      nameTag: tag.nameTag,
      textSize: textSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      child: AutoSizeText(
        nameTag,
        minFontSize: 5,
        maxLines: 1,
        style: ThemeFonts.generalNominativeStyle,
        group: textSize,
      ),
    );
  }
}
