import 'dart:async';

import 'package:base/base.dart';

/// A generic class that can provide a resource backed by both the sqlite database and the network.
/// Inspired by NetworkBoundResource from Android Architecture Components' GithubBrowserSample.
///
/// @param <ResultType> Type for the desired Result data
/// @param <RequestType> Type for the API response

class NetworkBoundResult<ResultType, RequestType> {
  final _controller = StreamController<Result<ResultType>>();
  StreamSubscription<ResultType?>? _dbSubscription;

  NetworkBoundResult({
    required this.loadFromDb,
    required this.shouldFetch,
    required this.createCall,
    required this.saveCallResult,
    required this.onFetchFailed,
  }) {
    _controller.add(ResultLoading());
    final dbStream = loadFromDb();
    _dbSubscription = dbStream.listen((data) {
      if (shouldFetch(data)) {
        _dbSubscription?.cancel();
        fetchFromNetwork(data);
      } else {
        if (data == null) {
          _controller.add(ResultError(Exception('Not found!')));
        } else {
          _controller.add(ResultSuccess(data));
        }
      }
    });
  }

  final Stream<ResultType?> Function() loadFromDb;
  final bool Function(ResultType? data) shouldFetch;
  final Future<RequestType> Function() createCall;
  final Future<void> Function(RequestType response) saveCallResult;
  final Future<void> Function() onFetchFailed;

  Stream<Result<ResultType>> asStream() => _controller.stream;

  Future<void> setValue(Result<ResultType> newValue) async {
    if (!_controller.isClosed) {
      _controller.add(newValue);
    }
  }

  Future<void> fetchFromNetwork(ResultType? dbSource) async {
    setValue(ResultLoading(dbSource));

    try {
      final apiResponse = await createCall();
      await saveCallResult(apiResponse);
      final newDbStream = loadFromDb();
      newDbStream.listen((newData) {
        if (newData == null) {
          setValue(ResultError(Exception('Not found!'), dbSource));
        } else {
          setValue(ResultSuccess(newData));
      }
      });
    } on Exception catch (e) {
      onFetchFailed();
      setValue(ResultError(e, dbSource));
    }
  }

  void dispose() {
    _controller.close();
  }
}