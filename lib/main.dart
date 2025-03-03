import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/resources/strings.dart';
import 'home/vocabulary_home.dart';
import 'providers/vocabulary_provider.dart';
import 'service_locator/locator.dart';

void main() {
  appSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<VocabularyProvider>(
          create: (_) => VocabularyProvider(),
        )
      ],
      child: MaterialApp(
        title: Strings.appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const VocabularyHome(),
      ),
    );
  }
}
