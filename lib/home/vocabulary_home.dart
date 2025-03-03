import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/resources/strings.dart';
import '../add/add_vocabulary.dart';
import '../database/app_database.dart';
import '../providers/vocabulary_provider.dart';
import '../utils/widgets/text_widget.dart';

class VocabularyHome extends StatelessWidget {
  const VocabularyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const CText(
          Strings.appBarTitle,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Consumer<VocabularyProvider>(
        builder: (context, vocabularyProvider, child) {
          vocabularyProvider.getAllVocabularies();

          if (vocabularyProvider.allVocabularies.isEmpty) {
            return const Center(
              child: CText(
                Strings.noVocabulary,
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: vocabularyProvider.allVocabularies.length,
              itemBuilder: (context, index) {
                VocabularyTableData currentVocabularyDataItem =
                    vocabularyProvider.allVocabularies[index];

                return ListTile(
                  onTap: () =>
                      goToAddEditPage(context, currentVocabularyDataItem),
                  onLongPress: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const CText(
                          Strings.deleteVocabulary,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                vocabularyProvider
                                    .deleteVocabulary(
                                        currentVocabularyDataItem.id)
                                    .then(
                                  (value) {
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                );
                              },
                              child: const CText(Strings.yesText)),
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const CText(Strings.noText)),
                        ],
                      );
                    },
                  ),
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: CText(
                    currentVocabularyDataItem.word,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(currentVocabularyDataItem.definition),
                      Text(currentVocabularyDataItem.exampleSentence ?? ''),
                    ],
                  ),
                  trailing: currentVocabularyDataItem.mastered
                      ? Icon(Icons.check)
                      : null,
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goToAddEditPage(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void goToAddEditPage(BuildContext context,
      [VocabularyTableData? vocabularyData]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            AddOrEditVocabulary(vocabularyTableData: vocabularyData),
      ),
    );
  }
}
