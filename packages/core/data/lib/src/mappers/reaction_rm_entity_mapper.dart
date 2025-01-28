import 'package:api/api.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:database/database.dart';

extension ReactionRMEntityMapper on ReactionRM {
  ReactionEntity toEntity() {
    return ReactionEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      user: user?.toEntity(),
      reactionToId: reactionToId?.toString() ?? '',
      reactionToType: reactionToType?.toString() ?? '',
      reactionType: reactionType?.toEntity() ?? ReactionTypeEntity.unknown,
      active: active != null ? active == 1 : true,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
