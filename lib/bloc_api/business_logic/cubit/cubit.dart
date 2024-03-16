import 'package:bloc/bloc.dart';
import 'package:my_subjects_lessons_2/bloc_api/business_logic/cubit/state.dart';
import 'package:my_subjects_lessons_2/bloc_api/data/models/characters.dart' as models;

import '../../data/repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharacterState> {

  final CharactersRepository charactersRepository;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<models.Character> characters = [];

  List<models.Character> getAllCharacters(){
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
