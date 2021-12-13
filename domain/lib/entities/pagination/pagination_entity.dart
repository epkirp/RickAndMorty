import 'package:domain/entities/character/character_entity.dart';

class PaginationEntity<T> {
  final int count;
  final int pages;
  final List<T> results;

  PaginationEntity({
    required this.count,
    required this.pages,
    required this.results,
  });

  factory PaginationEntity.fromJson(Map<String, dynamic> json) {
    return PaginationEntity<T>(
      count: json['info']['count'],
      pages: json['info']['pages'],
      results: PaginationEntity._itemsFromJson<T>(json['results'] as List),
    );
  }

  // todo подумать, как можно не искать типы через if else
  static _itemsFromJson<T>(List<dynamic> json) {
    if (T == CharacterEntity) {
      return json.map((item) => CharacterEntity.fromJson(item) as T).toList();
    } else {
      throw Exception('Wrong cast: PaginationEntity<${T.runtimeType}>');
    }
  }
}
