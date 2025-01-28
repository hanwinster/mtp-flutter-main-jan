import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetThematicUserGroupsUseCaseRequest extends Equatable {
  final int page;
  final int limit;
  final String keyword;
  final List<String> categoryIds;

  const GetThematicUserGroupsUseCaseRequest({
    required this.page,
    required this.limit,
    required this.keyword,
    required this.categoryIds,
  });

  @override
  List<Object?> get props => [
        page,
        limit,
        keyword,
        categoryIds,
      ];
}

class GetThematicUserGroupsUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  GetThematicUserGroupsUseCase({
    ThematicGroupRepository? thematicGroupRepository,
  }) : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<List<ThematicGroupListing>> call(
      GetThematicUserGroupsUseCaseRequest request) {
    return _thematicGroupRepository.getUserGroups(
      page: request.page,
      pageSize: request.limit,
      keyword: request.keyword,
      categories: request.categoryIds,
    );
  }
}
