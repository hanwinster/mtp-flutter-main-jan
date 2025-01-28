 
import 'package:domain/domain.dart';

abstract class VersionCheckRepo {
  Future<Version> getCurrentVersion();
}