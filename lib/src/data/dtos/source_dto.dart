import 'package:news_app_clean/src/domain/entities/source_entity.dart';

class SourceDto extends SourceEntity {
  SourceDto({
    required String name,
    String? id,
  }) : super(
          name: name,
          id: id,
        );

  factory SourceDto.fromMap(Map<String, dynamic> map) => SourceDto(
        id: map['id'],
        name: map['name'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };
}
