import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_api/model/character.dart';

class CharacterViewModel with ChangeNotifier {
  CharacterViewModel() {
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => _getCharacter());
  }

  final String api = "https://rickandmortyapi.com/api/character";

  final List<Character> _listCharacter = [];
  List<Character> get listCharacter => _listCharacter;

  void _getCharacter() async {
    Uri uri = Uri.parse(api);
    http.Response response = await http.get(uri);
    List<dynamic> allCharacter =
        (jsonDecode(response.body) as Map<String, dynamic>)["results"];

    for (Map<String, dynamic> characterMap in allCharacter) {
      _listCharacter.add(Character.fromMap(characterMap));
    }
    notifyListeners();
  }
}
