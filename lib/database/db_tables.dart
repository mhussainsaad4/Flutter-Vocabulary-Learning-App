import 'package:drift/drift.dart';

class VocabularyTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get word => text()();

  TextColumn get definition => text()();

  TextColumn get exampleSentence => text().nullable()();

  BoolColumn get mastered => boolean().withDefault(const Constant(false))();
}
