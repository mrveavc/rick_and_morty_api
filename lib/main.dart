import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_api/view/character_view.dart';
import 'package:rick_and_morty_api/view_model/character_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create: (BuildContext context) => CharacterViewModel(),
          child: CharacterView()),
    );
  }
}
