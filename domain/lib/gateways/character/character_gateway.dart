import 'package:domain/entities/character/character_entity.dart';
import 'package:domain/entities/pagination/pagination_entity.dart';

abstract class CharacterGateway {
  Future<PaginationEntity<CharacterEntity>> getCharacters({required int page});
}
