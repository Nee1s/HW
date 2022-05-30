// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class RecipesTableData extends DataClass
    implements Insertable<RecipesTableData> {
  final String globalId;
  final String title;
  final String imageLink;
  final String? authorLink;
  final String? sourceRecipeLink;
  final String? authorName;
  final String? description;
  final String? totalTime;
  final double? rating;
  RecipesTableData(
      {required this.globalId,
      required this.title,
      required this.imageLink,
      this.authorLink,
      this.sourceRecipeLink,
      this.authorName,
      this.description,
      this.totalTime,
      this.rating});
  factory RecipesTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RecipesTableData(
      globalId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}global_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      imageLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_link'])!,
      authorLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author_link']),
      sourceRecipeLink: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}source_recipe_link']),
      authorName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author_name']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      totalTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_time']),
      rating: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['global_id'] = Variable<String>(globalId);
    map['title'] = Variable<String>(title);
    map['image_link'] = Variable<String>(imageLink);
    if (!nullToAbsent || authorLink != null) {
      map['author_link'] = Variable<String?>(authorLink);
    }
    if (!nullToAbsent || sourceRecipeLink != null) {
      map['source_recipe_link'] = Variable<String?>(sourceRecipeLink);
    }
    if (!nullToAbsent || authorName != null) {
      map['author_name'] = Variable<String?>(authorName);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || totalTime != null) {
      map['total_time'] = Variable<String?>(totalTime);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double?>(rating);
    }
    return map;
  }

  RecipesTableCompanion toCompanion(bool nullToAbsent) {
    return RecipesTableCompanion(
      globalId: Value(globalId),
      title: Value(title),
      imageLink: Value(imageLink),
      authorLink: authorLink == null && nullToAbsent
          ? const Value.absent()
          : Value(authorLink),
      sourceRecipeLink: sourceRecipeLink == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceRecipeLink),
      authorName: authorName == null && nullToAbsent
          ? const Value.absent()
          : Value(authorName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      totalTime: totalTime == null && nullToAbsent
          ? const Value.absent()
          : Value(totalTime),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
    );
  }

  factory RecipesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipesTableData(
      globalId: serializer.fromJson<String>(json['globalId']),
      title: serializer.fromJson<String>(json['title']),
      imageLink: serializer.fromJson<String>(json['imageLink']),
      authorLink: serializer.fromJson<String?>(json['authorLink']),
      sourceRecipeLink: serializer.fromJson<String?>(json['sourceRecipeLink']),
      authorName: serializer.fromJson<String?>(json['authorName']),
      description: serializer.fromJson<String?>(json['description']),
      totalTime: serializer.fromJson<String?>(json['totalTime']),
      rating: serializer.fromJson<double?>(json['rating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'globalId': serializer.toJson<String>(globalId),
      'title': serializer.toJson<String>(title),
      'imageLink': serializer.toJson<String>(imageLink),
      'authorLink': serializer.toJson<String?>(authorLink),
      'sourceRecipeLink': serializer.toJson<String?>(sourceRecipeLink),
      'authorName': serializer.toJson<String?>(authorName),
      'description': serializer.toJson<String?>(description),
      'totalTime': serializer.toJson<String?>(totalTime),
      'rating': serializer.toJson<double?>(rating),
    };
  }

  RecipesTableData copyWith(
          {String? globalId,
          String? title,
          String? imageLink,
          String? authorLink,
          String? sourceRecipeLink,
          String? authorName,
          String? description,
          String? totalTime,
          double? rating}) =>
      RecipesTableData(
        globalId: globalId ?? this.globalId,
        title: title ?? this.title,
        imageLink: imageLink ?? this.imageLink,
        authorLink: authorLink ?? this.authorLink,
        sourceRecipeLink: sourceRecipeLink ?? this.sourceRecipeLink,
        authorName: authorName ?? this.authorName,
        description: description ?? this.description,
        totalTime: totalTime ?? this.totalTime,
        rating: rating ?? this.rating,
      );
  @override
  String toString() {
    return (StringBuffer('RecipesTableData(')
          ..write('globalId: $globalId, ')
          ..write('title: $title, ')
          ..write('imageLink: $imageLink, ')
          ..write('authorLink: $authorLink, ')
          ..write('sourceRecipeLink: $sourceRecipeLink, ')
          ..write('authorName: $authorName, ')
          ..write('description: $description, ')
          ..write('totalTime: $totalTime, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(globalId, title, imageLink, authorLink,
      sourceRecipeLink, authorName, description, totalTime, rating);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipesTableData &&
          other.globalId == this.globalId &&
          other.title == this.title &&
          other.imageLink == this.imageLink &&
          other.authorLink == this.authorLink &&
          other.sourceRecipeLink == this.sourceRecipeLink &&
          other.authorName == this.authorName &&
          other.description == this.description &&
          other.totalTime == this.totalTime &&
          other.rating == this.rating);
}

class RecipesTableCompanion extends UpdateCompanion<RecipesTableData> {
  final Value<String> globalId;
  final Value<String> title;
  final Value<String> imageLink;
  final Value<String?> authorLink;
  final Value<String?> sourceRecipeLink;
  final Value<String?> authorName;
  final Value<String?> description;
  final Value<String?> totalTime;
  final Value<double?> rating;
  const RecipesTableCompanion({
    this.globalId = const Value.absent(),
    this.title = const Value.absent(),
    this.imageLink = const Value.absent(),
    this.authorLink = const Value.absent(),
    this.sourceRecipeLink = const Value.absent(),
    this.authorName = const Value.absent(),
    this.description = const Value.absent(),
    this.totalTime = const Value.absent(),
    this.rating = const Value.absent(),
  });
  RecipesTableCompanion.insert({
    required String globalId,
    required String title,
    required String imageLink,
    this.authorLink = const Value.absent(),
    this.sourceRecipeLink = const Value.absent(),
    this.authorName = const Value.absent(),
    this.description = const Value.absent(),
    this.totalTime = const Value.absent(),
    this.rating = const Value.absent(),
  })  : globalId = Value(globalId),
        title = Value(title),
        imageLink = Value(imageLink);
  static Insertable<RecipesTableData> custom({
    Expression<String>? globalId,
    Expression<String>? title,
    Expression<String>? imageLink,
    Expression<String?>? authorLink,
    Expression<String?>? sourceRecipeLink,
    Expression<String?>? authorName,
    Expression<String?>? description,
    Expression<String?>? totalTime,
    Expression<double?>? rating,
  }) {
    return RawValuesInsertable({
      if (globalId != null) 'global_id': globalId,
      if (title != null) 'title': title,
      if (imageLink != null) 'image_link': imageLink,
      if (authorLink != null) 'author_link': authorLink,
      if (sourceRecipeLink != null) 'source_recipe_link': sourceRecipeLink,
      if (authorName != null) 'author_name': authorName,
      if (description != null) 'description': description,
      if (totalTime != null) 'total_time': totalTime,
      if (rating != null) 'rating': rating,
    });
  }

  RecipesTableCompanion copyWith(
      {Value<String>? globalId,
      Value<String>? title,
      Value<String>? imageLink,
      Value<String?>? authorLink,
      Value<String?>? sourceRecipeLink,
      Value<String?>? authorName,
      Value<String?>? description,
      Value<String?>? totalTime,
      Value<double?>? rating}) {
    return RecipesTableCompanion(
      globalId: globalId ?? this.globalId,
      title: title ?? this.title,
      imageLink: imageLink ?? this.imageLink,
      authorLink: authorLink ?? this.authorLink,
      sourceRecipeLink: sourceRecipeLink ?? this.sourceRecipeLink,
      authorName: authorName ?? this.authorName,
      description: description ?? this.description,
      totalTime: totalTime ?? this.totalTime,
      rating: rating ?? this.rating,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (globalId.present) {
      map['global_id'] = Variable<String>(globalId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (imageLink.present) {
      map['image_link'] = Variable<String>(imageLink.value);
    }
    if (authorLink.present) {
      map['author_link'] = Variable<String?>(authorLink.value);
    }
    if (sourceRecipeLink.present) {
      map['source_recipe_link'] = Variable<String?>(sourceRecipeLink.value);
    }
    if (authorName.present) {
      map['author_name'] = Variable<String?>(authorName.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (totalTime.present) {
      map['total_time'] = Variable<String?>(totalTime.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double?>(rating.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesTableCompanion(')
          ..write('globalId: $globalId, ')
          ..write('title: $title, ')
          ..write('imageLink: $imageLink, ')
          ..write('authorLink: $authorLink, ')
          ..write('sourceRecipeLink: $sourceRecipeLink, ')
          ..write('authorName: $authorName, ')
          ..write('description: $description, ')
          ..write('totalTime: $totalTime, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }
}

class $RecipesTableTable extends RecipesTable
    with TableInfo<$RecipesTableTable, RecipesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _globalIdMeta = const VerificationMeta('globalId');
  @override
  late final GeneratedColumn<String?> globalId = GeneratedColumn<String?>(
      'global_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageLinkMeta = const VerificationMeta('imageLink');
  @override
  late final GeneratedColumn<String?> imageLink = GeneratedColumn<String?>(
      'image_link', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _authorLinkMeta = const VerificationMeta('authorLink');
  @override
  late final GeneratedColumn<String?> authorLink = GeneratedColumn<String?>(
      'author_link', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _sourceRecipeLinkMeta =
      const VerificationMeta('sourceRecipeLink');
  @override
  late final GeneratedColumn<String?> sourceRecipeLink =
      GeneratedColumn<String?>('source_recipe_link', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _authorNameMeta = const VerificationMeta('authorName');
  @override
  late final GeneratedColumn<String?> authorName = GeneratedColumn<String?>(
      'author_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _totalTimeMeta = const VerificationMeta('totalTime');
  @override
  late final GeneratedColumn<String?> totalTime = GeneratedColumn<String?>(
      'total_time', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double?> rating = GeneratedColumn<double?>(
      'rating', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        globalId,
        title,
        imageLink,
        authorLink,
        sourceRecipeLink,
        authorName,
        description,
        totalTime,
        rating
      ];
  @override
  String get aliasedName => _alias ?? 'recipes_table';
  @override
  String get actualTableName => 'recipes_table';
  @override
  VerificationContext validateIntegrity(Insertable<RecipesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('global_id')) {
      context.handle(_globalIdMeta,
          globalId.isAcceptableOrUnknown(data['global_id']!, _globalIdMeta));
    } else if (isInserting) {
      context.missing(_globalIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image_link')) {
      context.handle(_imageLinkMeta,
          imageLink.isAcceptableOrUnknown(data['image_link']!, _imageLinkMeta));
    } else if (isInserting) {
      context.missing(_imageLinkMeta);
    }
    if (data.containsKey('author_link')) {
      context.handle(
          _authorLinkMeta,
          authorLink.isAcceptableOrUnknown(
              data['author_link']!, _authorLinkMeta));
    }
    if (data.containsKey('source_recipe_link')) {
      context.handle(
          _sourceRecipeLinkMeta,
          sourceRecipeLink.isAcceptableOrUnknown(
              data['source_recipe_link']!, _sourceRecipeLinkMeta));
    }
    if (data.containsKey('author_name')) {
      context.handle(
          _authorNameMeta,
          authorName.isAcceptableOrUnknown(
              data['author_name']!, _authorNameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('total_time')) {
      context.handle(_totalTimeMeta,
          totalTime.isAcceptableOrUnknown(data['total_time']!, _totalTimeMeta));
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {globalId};
  @override
  RecipesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RecipesTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RecipesTableTable createAlias(String alias) {
    return $RecipesTableTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $RecipesTableTable recipesTable = $RecipesTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recipesTable];
}
