import 'package:my_subjects_lessons_2/bloc_api/data/web_services/characters_web_services.dart';

import '../models/characters.dart' as models;

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<models.Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => models.Character.fromJson(character)).toList();
  }
}