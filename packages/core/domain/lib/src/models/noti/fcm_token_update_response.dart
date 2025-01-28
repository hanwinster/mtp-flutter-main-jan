import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class FcmTokenUpdateResponse extends Equatable {
  final String message;
  final User data;

  const FcmTokenUpdateResponse({
    required this.message,
    required this.data,
  });

  @override
  List<Object> get props => [message, data];
}