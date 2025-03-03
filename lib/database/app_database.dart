import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'db_tables.dart';

import '../utils/resources/strings.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(
    () {
      return driftDatabase(name: Strings.appDatabase);
    },
  );
}

@DriftDatabase(tables: [VocabularyTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

/// todo Now Run Flutter Terminal Commnads for database code generation
