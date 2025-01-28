part of 'e_library_bloc.dart';

sealed class ELibraryEvent extends Equatable {
  const ELibraryEvent();
}

class GetELibraryBooks extends ELibraryEvent {
  final String query;
  final String subject;
  final String resourceFormat;

  const GetELibraryBooks({
    required this.query,
    required this.subject,
    required this.resourceFormat,
  });

  @override
  List<Object?> get props => [query, subject, resourceFormat];
}

class GetELibraryBooksLoadMore extends ELibraryEvent {
  final String query;
  final String subject;
  final String resourceFormat;

  const GetELibraryBooksLoadMore({
    required this.query,
    required this.subject,
    required this.resourceFormat,
  });
  @override
  List<Object?> get props => [query, subject, resourceFormat];
}
