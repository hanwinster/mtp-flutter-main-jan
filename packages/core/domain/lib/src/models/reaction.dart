import 'package:base/base.dart';

import 'package:domain/domain.dart';

class Reaction extends Equatable {
  final String id;
  final User? user;
  final String reactionToId;
  final String reactionToType;
  final ReactionType reactionType;
  final DateTime createdAt;
  final DateTime? updatedAt;
  
  @override
  List<Object?> get props =>
      [
        id,
        user,
        reactionToId,
        reactionToType,
        reactionType,
        createdAt,
        updatedAt,
      ];

  const Reaction({
    required this.id,
    this.user,
    required this.reactionToId,
    required this.reactionToType,
    required this.reactionType,
    required this.createdAt,
    required this.updatedAt,
  });
}