import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift_database;
import 'package:provider/provider.dart';

import '../utils/resources/strings.dart';
import '../providers/vocabulary_provider.dart';
import '../database/app_database.dart';
import '../utils/widgets/text_widget.dart';

class AddOrEditVocabulary extends StatefulWidget {
  const AddOrEditVocabulary({super.key, this.vocabularyTableData});

  final VocabularyTableData? vocabularyTableData;

  @override
  State<AddOrEditVocabulary> createState() => _AddOrEditVocabularyState();
}

class _AddOrEditVocabularyState extends State<AddOrEditVocabulary> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _definitionController = TextEditingController();
  final TextEditingController _exampleSentenceController =
      TextEditingController();

  @override
  void initState() {
    if (widget.vocabularyTableData != null) {
      _wordController.text = widget.vocabularyTableData!.word;
      _definitionController.text = widget.vocabularyTableData!.definition;
      _exampleSentenceController.text =
          widget.vocabularyTableData!.exampleSentence ?? '';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VocabularyProvider>(
      builder: (context, vocabularyProvider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
            ),
            backgroundColor: Colors.indigo,
            title: CText(
              widget.vocabularyTableData == null
                  ? Strings.addVocabulary
                  : Strings.editVocabulary,
              style: const TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return Strings.editNullWord;
                      }
                    },
                    controller: _wordController,
                    decoration: InputDecoration(
                      labelText: Strings.editWordLabel,
                      helperText: Strings.editWordText,
                      hintText: Strings.editWordHint,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                //
                //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return Strings.definitionNullWord;
                      }
                    },
                    controller: _definitionController,
                    decoration: InputDecoration(
                      labelText: Strings.editDefinitionLabel,
                      helperText: Strings.editDefinitionText,
                      hintText: Strings.editDefinitionHint,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                //
                //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _exampleSentenceController,
                    decoration: InputDecoration(
                      labelText: Strings.editSentenceLabel,
                      helperText: Strings.editSentenceText,
                      hintText: Strings.editSentenceHint,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                //
                //
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CText(Strings.editIsMastered),
                    ),
                    Checkbox(
                      value: vocabularyProvider.checkBoxValue,
                      onChanged: (_) => vocabularyProvider.setCheckBoxValue(),
                    ),
                  ],
                ),
                //
                //
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      //
                      //
                      if (widget.vocabularyTableData != null) {
                        VocabularyTableCompanion vocabularyCompanion =
                            VocabularyTableCompanion(
                                id: drift_database.Value(
                                    widget.vocabularyTableData!.id),
                                word:
                                    drift_database.Value(_wordController.text),
                                definition: drift_database.Value(
                                    _definitionController.text),
                                exampleSentence: drift_database.Value(
                                  _exampleSentenceController.text == ''
                                      ? null
                                      : _exampleSentenceController.text,
                                ),
                                mastered: drift_database.Value(
                                    vocabularyProvider.checkBoxValue));

                        await vocabularyProvider
                            .updateVocabulary(vocabularyCompanion)
                            .then((value) {
                          if (!context.mounted) {
                            return;
                          } else {
                            showSnackBar(
                              context,
                              Strings.editUpdatedVocabulary,
                            );
                          }
                        });
                      } else {
                        VocabularyTableCompanion vocabularyCompanion =
                            VocabularyTableCompanion(
                                word:
                                    drift_database.Value(_wordController.text),
                                definition: drift_database.Value(
                                    _definitionController.text),
                                exampleSentence: drift_database.Value(
                                  _exampleSentenceController.text == ''
                                      ? null
                                      : _exampleSentenceController.text,
                                ),
                                mastered: drift_database.Value(
                                    vocabularyProvider.checkBoxValue));

                        await vocabularyProvider
                            .addVocabulary(vocabularyCompanion)
                            .then((value) {
                          if (!context.mounted) {
                            return;
                          } else {
                            showSnackBar(
                              context,
                              Strings.editAddedVocabulary,
                            );
                          }
                        });
                      }
                      if (!context.mounted) {
                        return;
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: CText(widget.vocabularyTableData == null
                      ? Strings.addVocabulary
                      : Strings.editVocabulary),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CText(text),
      ),
    );
  }
}
