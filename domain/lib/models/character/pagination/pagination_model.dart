import 'package:domain/entities/character/character_entity.dart';
import 'package:domain/entities/pagination/pagination_entity.dart';
import 'package:domain/models/character/character_model.dart';

class PaginationModel<T> {
  final int count;
  final int pages;
  final List<T> results;

  PaginationModel({
    required this.count,
    required this.pages,
    required this.results,
  });

  factory PaginationModel.createModelFromEntity(PaginationEntity entity) {
    return PaginationModel<T>(
      count: entity.count,
      pages: entity.pages,
      results: PaginationModel._itemsFromEntity<T>(entity.results),
    );
  }

  // todo подумать, как можно не искать типы через if else
  static _itemsFromEntity<T>(List<dynamic> entityResults) {
    if (T == CharacterModel) {
      return entityResults.map((e) => CharacterModel.createModelFromEntity(e as CharacterEntity)).toList();
    } else {
      throw Exception('Wrong cast: PaginationModel<${T.runtimeType}>');
    }
  }
}
