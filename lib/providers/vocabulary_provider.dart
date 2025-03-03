import 'package:flutter/material.dart';
import 'package:flutter_vocabulary_learning_app/database/app_database.dart';

import '../repository/vocabulary_repository.dart';

class VocabularyProvider extends ChangeNotifier {
  VocabularyProvider() {
    getAllVocabularies();
  }

  final VocabularyRepository _vocabularyRepository = VocabularyRepository();

  List<VocabularyTableData> _allVocabularies = [];

  List<VocabularyTableData> get allVocabularies => _allVocabularies;

  bool _checkBoxValue = false;

  bool get checkBoxValue => _checkBoxValue;

  setCheckBoxValue() async {
    _checkBoxValue = !_checkBoxValue;
    notifyListeners();
  }

  getAllVocabularies() async {
    _allVocabularies = await _vocabularyRepository.getAllVocabularies();
    notifyListeners();
  }

  Future<int> addVocabulary(
      VocabularyTableCompanion vocabularyCompanion) async {
    var future = await _vocabularyRepository.addVocabulary(vocabularyCompanion);
    await getAllVocabularies();
    return future;
  }

  Future<bool> updateVocabulary(VocabularyTableCompanion vocabularyCompanion) async {
    var future = await _vocabularyRepository.updateVocabulary(vocabularyCompanion);
    getAllVocabularies();
    return future;
  }

  Future<int> deleteVocabulary(int id) async {
    var future = await _vocabularyRepository.deleteVocabulary(id);
    getAllVocabularies();
    return future;
  }
}
