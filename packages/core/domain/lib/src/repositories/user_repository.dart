import 'package:domain/domain.dart';

abstract class UserRepository {
  Future<UpdateUserResult> updateUser({
    required UpdateUserRequest request,
  });
}
