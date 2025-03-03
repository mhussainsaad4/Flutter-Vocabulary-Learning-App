import 'dart:developer';

import '../database/app_database.dart';
import '../service_locator/locator.dart';

class VocabularyRepository {
  final AppDatabase _database = locator.get<AppDatabase>();

  Future<List<VocabularyTableData>> getAllVocabularies() async {
    try {
      return await _database.select(_database.vocabularyTable).get();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  getVocabularyById(int id) async {
    try {
      return await (_database.select(_database.vocabularyTable)
            ..where(
              (vocabularyTable) => vocabularyTable.id.equals(id),
            ))
          .getSingle();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<int> addVocabulary(
      VocabularyTableCompanion vocabularyCompanion) async {
    try {
      return await _database
          .into(_database.vocabularyTable)
          .insert(vocabularyCompanion);
    } catch (e) {
      log(e.toString());
      return -1;
    }
  }

  Future<bool> updateVocabulary(VocabularyTableCompanion vocabularyCompanion) async {
    try {
      return await _database
          .update(_database.vocabularyTable)
          .replace(vocabularyCompanion);
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<int> deleteVocabulary(int id) async {
    try {
      return await (_database.delete(_database.vocabularyTable)
            ..where(
              (vocabularyTable) => vocabularyTable.id.equals(id),
            ))
          .go();
    } catch (e) {
      log(e.toString());
      return -1;
    }
  }
}
