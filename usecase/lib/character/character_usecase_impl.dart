import 'package:domain/entities/character/character_entity.dart';
import 'package:domain/entities/pagination/pagination_entity.dart';
import 'package:domain/gateways/character/character_gateway.dart';
import 'package:domain/models/character/character_model.dart';
import 'package:domain/models/character/pagination/pagination_model.dart';
import 'package:domain/usecases/character_usecase.dart';

class CharacterUseCaseImpl extends CharacterUseCase {
  final CharacterGateway characterGateway;

  CharacterUseCaseImpl({required this.characterGateway});

  @override
  Future<PaginationModel<CharacterModel>> getCharacters({required int page}) async {
    final PaginationEntity<CharacterEntity> paginationEntity = await characterGateway.getCharacters(page: page);

    return PaginationModel<CharacterModel>.createModelFromEntity(paginationEntity);
  }
}
