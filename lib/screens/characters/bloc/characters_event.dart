part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent {}

class CharactersGetCharacters extends CharactersEvent {}

class CharactersRefresh extends CharactersEvent {}
