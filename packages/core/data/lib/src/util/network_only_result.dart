import 'dart:async';

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

/// A generic class that can provide a resource backed by both the sqlite database and the network.
/// Inspired by NetworkBoundResource from Android Architecture Components' GithubBrowserSample.
///
/// @param <ResultType> Type for the desired Result data
/// @param <RequestType> Type for the API response
abstract class NetworkOnlyResult<ResultType, RequestType> {
  NetworkOnlyResult({
    required this.createCall,
  }) {
    controller = StreamController<Result<ResultType>>();
    _setupStream();
  }

  final Future<RequestType> Function() createCall;

  late StreamController<Result<ResultType>> controller;

  Stream<Result<ResultType>> stream() {
    return controller.stream;
  }

  Future<void> _setupStream() async {
    controller.add(ResultLoading());

    await fetchFromNetwork();
  }

  ResultType processResponse(RequestType response);

  Future<void> fetchFromNetwork() async {
    try {
      final response = await remoteDataSourceCall(() async {
        return createCall();
      });

      controller.add(ResultSuccess(processResponse(response)));

    } on DomainException catch (e) {
      controller.add(ResultError(e, null));
    } catch (e) {
      controller
          .add(ResultError(Exception('Unknown error: ${e.toString()}'), null));
    }
  }

  void dispose() {
    controller.close();
  }
}
