import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/models/character/character_model.dart';
import 'package:domain/models/character/pagination/pagination_model.dart';
import 'package:domain/usecases/character_usecase.dart';
import 'package:meta/meta.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterUseCase _characterUseCase;

  int _page = 1;
  int _countOfPages = 1;

  CharactersBloc({required CharacterUseCase characterUseCase})
      : _characterUseCase = characterUseCase,
        super(const CharactersState(isPaginationLoading: true)) {
    on<CharactersGetCharacters>(_fetchCharacters);
    on<CharactersRefresh>(_refreshCharacters);
  }

  Future<void> _fetchCharacters(CharactersGetCharacters event, Emitter<CharactersState> emit) async {
    try {
      if (_page <= _countOfPages) {
        emit(
          state.copyWith(isPaginationLoading: true),
        );
        final PaginationModel<CharacterModel> paginationPart = await _characterUseCase.getCharacters(page: _page);

        _page++;
        _countOfPages = paginationPart.pages;

        return emit(
          state.copyWith(
            characters: [...state.characters, ...paginationPart.results],
            isPaginationLoading: false,
          ),
        );
      }
    } catch (e) {
      return emit(state.copyWith(isPaginationLoading: false));
    }
  }

  Future<void> _refreshCharacters(CharactersRefresh event, Emitter<CharactersState> emit) async {
    try {
      emit(
        state.copyWith(isPaginationLoading: true),
      );
      final PaginationModel<CharacterModel> paginationPart = await _characterUseCase.getCharacters(page: 1);

      _page = 2;
      _countOfPages = paginationPart.pages;

      return emit(
        state.copyWith(
          characters: paginationPart.results,
          isPaginationLoading: false,
        ),
      );
    } catch (e) {
      return emit(state.copyWith(isPaginationLoading: false));
    }
  }
}
