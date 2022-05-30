import 'package:drift/drift.dart';

class RecipesTable extends Table {
  TextColumn get globalId => text().named('global_id')();
  TextColumn get title => text()();
  TextColumn get imageLink => text()();
  TextColumn get authorLink => text().nullable()();
  TextColumn get sourceRecipeLink => text().nullable()();
  TextColumn get authorName => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get totalTime => text().nullable()();
  RealColumn get rating => real().nullable()();

  @override
  Set<Column<dynamic>> get primaryKey => <TextColumn>{globalId};
}

///Попытался - не вышло, времени совсем в обрез
class TagsTable extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get idRecipe => text().references(RecipesTable, #globalId)();
  TextColumn get nameTag => text()();
  TextColumn get searchId => text()();
}

class IngredientsTable extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get idRecipe => text().references(RecipesTable, #globalId)();
  TextColumn get name => text()();
  RealColumn get quantity => real().nullable()();
  TextColumn get unit => text().nullable()();
  TextColumn get clarification => text().nullable()();
}

class NutritionTable extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get idRecipe => text().references(RecipesTable, #globalId)();
  TextColumn get element => text()();
  RealColumn get quantity => real()();
  TextColumn get unitAbbreviation => text()();
}
