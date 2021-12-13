import 'package:domain/models/character/character_model.dart';
import 'package:domain/models/character/pagination/pagination_model.dart';

abstract class CharacterUseCase {
  Future<PaginationModel<CharacterModel>> getCharacters({required int page});
}
