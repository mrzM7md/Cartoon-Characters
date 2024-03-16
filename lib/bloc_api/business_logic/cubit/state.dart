
import 'package:flutter/material.dart';
import 'package:my_subjects_lessons_2/bloc_api/data/models/characters.dart' as models;

@immutable
abstract class CharacterState {}

class CharactersInitial extends CharacterState{}

class CharactersLoaded extends CharacterState{
  final List<models.Character> characters;

  CharactersLoaded(this.characters);
}