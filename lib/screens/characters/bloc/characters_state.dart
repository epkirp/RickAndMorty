part of 'characters_bloc.dart';

class CharactersState {
  final List<CharacterModel> characters;
  final bool isPaginationLoading;
  final int? totalCharacters;

  const CharactersState({
    this.characters = const [],
    this.isPaginationLoading = false,
    this.totalCharacters,
  });

  CharactersState copyWith({
    List<CharacterModel>? characters,
    bool? isPaginationLoading,
    int? totalCharacters,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      totalCharacters: totalCharacters ?? this.totalCharacters,
    );
  }
}
