import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_api/model/character.dart';
import 'package:rick_and_morty_api/view_model/character_view_model.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Character"),
        ),
        body: Consumer<CharacterViewModel>(
          builder: (context, viewModel, child) => ListView.builder(
            itemCount: viewModel.listCharacter.length,
            itemBuilder: (context, index) {
              Character character = viewModel.listCharacter[index];
              return _buildCard(character);
            },
          ),
        ));
  }

  Widget _buildCard(Character character) {
    return Card(
      color: const Color.fromARGB(255, 82, 81, 81),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: Image.network(character.image)),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Row(
                        children: [
                          if (character.status == 'Dead')
                            const Icon(Icons.radio_button_checked,
                                color: Colors.red, size: 10),
                          if (character.status == 'Alive')
                            const Icon(Icons.radio_button_checked,
                                color: Colors.green, size: 10),
                          if (character.status == 'unknown')
                            const Icon(Icons.radio_button_checked,
                                color: Colors.yellow, size: 10),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            character.status,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                          const Text(
                            " - ",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            character.species,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Last know location:",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      Text(
                        character.location,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )

          // Image.network(character.image),
          // Text(character.name),
        ],
      ),
    );
  }
}
