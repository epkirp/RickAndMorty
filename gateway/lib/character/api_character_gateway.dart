import 'package:dio/dio.dart';
import 'package:domain/entities/character/character_entity.dart';
import 'package:domain/entities/pagination/pagination_entity.dart';
import 'package:domain/gateways/character/character_gateway.dart';
import 'package:gateway/base_dio_request.dart';

class ApiCharacterGateway extends CharacterGateway {
  final Dio dio;

  ApiCharacterGateway({required this.dio});

  @override
  Future<PaginationEntity<CharacterEntity>> getCharacters({required int page}) {
    return ApiRequestHandler.sendRequest(
      request: dio.get('/character', queryParameters: {'page': page}),
      converter: (json) => PaginationEntity<CharacterEntity>.fromJson(json),
    );
  }
}
