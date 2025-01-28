import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetThematicRecommendGroupsUseCaseRequest extends Equatable {
  final int page;
  final int limit;
  final String keyword;
  final List<String> categoryIds;

  const GetThematicRecommendGroupsUseCaseRequest({
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

class GetThematicRecommendGroupsUseCase {
  final ThematicGroupRepository _thematicGroupRepository;

  GetThematicRecommendGroupsUseCase({
    ThematicGroupRepository? thematicGroupRepository,
  }) : _thematicGroupRepository = thematicGroupRepository ?? getIt();

  Future<List<ThematicGroupListing>> call(
      GetThematicRecommendGroupsUseCaseRequest request) {
    return _thematicGroupRepository.getRecommendGroups(
      page: request.page,
      pageSize: request.limit,
      keyword: request.keyword,
      categories: request.categoryIds,
    );
  }
}
