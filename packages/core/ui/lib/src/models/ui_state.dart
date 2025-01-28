import 'package:base/base.dart';
import 'package:design_system/design_system.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/src/widgets/widgets.dart';

enum UiFailureType {
  unauthorized,
  network,
  server,
  client,
  other,
}

sealed class UiState<T> extends Equatable {
  const UiState();

  static UiState<T> fromResult<T>(Result<T> result) {
    switch (result) {
      case ResultSuccess():
        if (result.data is List && (result.data as List).isEmpty) {
          return const UiStateEmpty();
        } else if (result.data == null) {
          return const UiStateEmpty();
        } else {
          return UiStateSuccess(result.data);
        }
      case ResultError():
        return UiStateFailure.fromException(
            result.exception, result.dataOrNull);
      case ResultLoading():
        return UiStateInProgress(result.dataOrNull);
    }
  }

  static UiState<O> fromResultTransform<I, O>(
    Result<I?> result,
    O Function(I data) transformer,
  ) {
    switch (result) {
      case ResultSuccess():
        final data = result.data;
        if (data is List && (data as List).isEmpty) {
          return const UiStateEmpty();
        } else {
          if (data == null) {
            return const UiStateEmpty();
          } else {
            return UiStateSuccess(transformer(data));
          }
        }
      case ResultError():
        final data = result.dataOrNull;
        if (data != null) {
          return UiStateFailure.fromException(
              (result).exception, transformer(data));
        } else {
          return UiStateFailure.fromException((result).exception, null);
        }
      case ResultLoading():
        final data = result.dataOrNull;
        if (data != null) {
          return UiStateInProgress(transformer(data));
        } else {
          return const UiStateInProgress();
        }
    }
  }
}

final class UiStateInitial<T> extends UiState<T> {
  const UiStateInitial();

  @override
  List<Object> get props => [];
}

final class UiStateInProgress<T> extends UiState<T> {
  const UiStateInProgress([this.data]);

  final T? data;

  @override
  List<Object?> get props => [data];
}

final class UiStateSuccess<T> extends UiState<T> {
  const UiStateSuccess(this.data);

  final T data;

  @override
  List<Object?> get props => [data];
}

final class UiStateEmpty<T> extends UiState<T> {
  const UiStateEmpty([this.message = '']);

  final String message;

  @override
  List<Object> get props => [message];
}

final class UiStateFailure<T> extends UiState<T> {
  const UiStateFailure._({
    this.message = '',
    this.type = UiFailureType.other,
    this.retryable = true,
    this.data,
  });

  final String message;
  final UiFailureType type;
  final bool retryable;
  final T? data;

  @override
  List<Object?> get props => [message, type, retryable, data];

  bool get isUnauthorized => type == UiFailureType.unauthorized;

  bool get isClientError => type == UiFailureType.client;

  static UiStateFailure<T> unauthorized<T>([String message = '']) =>
      UiStateFailure<T>._(message: message, type: UiFailureType.unauthorized);

  static UiStateFailure<T> network<T>([String message = '', T? data]) =>
      UiStateFailure<T>._(
          message: message, type: UiFailureType.network, data: data);

  static UiStateFailure<T> server<T>([String message = '', T? data]) =>
      UiStateFailure<T>._(
          message: message, type: UiFailureType.server, data: data);

  static UiStateFailure<T> client<T>([String message = '', T? data]) =>
      UiStateFailure<T>._(
          message: message, type: UiFailureType.client, data: data);

  static UiStateFailure<T> other<T>([String message = '', T? data]) =>
      UiStateFailure<T>._(
          message: message, type: UiFailureType.other, data: data);

  static UiStateFailure<T> fromException<T>(Exception exception, [T? data]) {
    if (exception is DomainException) {
      return _fromDomainException<T>(exception, data);
    } else {
      return _fromDomainException<T>(const UnknownDomainException(), data);
    }
  }

  static UiStateFailure<T> fromError<T>(
    Object error, [
    StackTrace? stackTrace,
    T? data,
  ]) {
    if (error is DomainException) {
      return _fromDomainException<T>(error, data);
    } else {
      logger.e('Unknown error', error, stackTrace);
      return _fromDomainException<T>(const UnknownDomainException(), data);
    }
  }

  static UiStateFailure<T> clientError<T>(T data) {
    return _fromDomainException<T>(const UnknownDomainException(), data);
  }

  static UiStateFailure<T> _fromDomainException<T>(
    DomainException domainException,
    T? data,
  ) {
    if (domainException is UnauthorizedDomainException) {
      return unauthorized<T>(domainException.message);
    } else if (domainException is NetworkDomainException) {
      return network<T>(domainException.message, data);
    } else if (domainException is ServerDomainException) {
      return server<T>(domainException.message, data);
    } else if (domainException is ClientDomainException) {
      return client<T>(domainException.message, data);
    } else {
      return other<T>(domainException.message, data);
    }
  }
}

extension UiStateX<T> on UiState<T> {
  T get dataOrThrow {
    if (this is UiStateSuccess<T>) {
      return (this as UiStateSuccess<T>).data;
    } else if (this is UiStateFailure<T>) {
      return (this as UiStateFailure<T>).data ??
          (throw Exception('Data is null'));
    } else if (this is UiStateInProgress<T>) {
      return (this as UiStateInProgress<T>).data ??
          (throw Exception('Data is null'));
    }

    throw Exception('Invalid state');
  }

  T? get dataOrNull {
    if (this is UiStateSuccess<T>) {
      final data = (this as UiStateSuccess<T>).data;
      if (data is List && data.isEmpty) {
        return null;
      }
      return data;
    } else if (this is UiStateFailure<T>) {
      final data = (this as UiStateFailure<T>).data;
      if (data is List && data.isEmpty) {
        return null;
      }
      return data;
    } else if (this is UiStateInProgress<T>) {
      final data = (this as UiStateInProgress<T>).data;
      if (data is List && data.isEmpty) {
        return null;
      }
      return data;
    } else {
      return null;
    }
  }

  String? errorOrNull(BuildContext context) => (this is UiStateFailure<T>)
      ? (this as UiStateFailure<T>).resolveMessage(context)
      : null;

  bool get isInProgress => this is UiStateInProgress<T>;

  bool get isNotInProgress => !isInProgress;

  bool get isSuccess => this is UiStateSuccess<T> || this is UiStateEmpty<T>;

  bool get isFailure => this is UiStateFailure<T>;

  String messageOrEmpty(BuildContext context) {
    switch (this) {
      case UiStateEmpty():
        return (this as UiStateEmpty<T>).message;
      case UiStateFailure():
        return (this as UiStateFailure<T>).resolveMessage(context);
      default:
        return '';
    }
  }

  Widget toView(
    BuildContext context, {
    Widget Function(T data)? successViewBuilder,
    Widget Function(T? data)? loadingViewBuilder,
    Widget Function(UiStateFailure error)? errorViewBuilder,
    Widget Function(String message)? emptyViewBuilder,
    Widget Function()? initialViewBuilder,
    bool showCachedData = true,
    Function()? onRetried,
  }) {
    switch (this) {
      case UiStateSuccess():
        return successViewBuilder?.call((this as UiStateSuccess<T>).data) ??
            Container();
      case UiStateInProgress():
        if (showCachedData && dataOrNull != null) {
          return successViewBuilder?.call(dataOrThrow) ?? Container();
        }
        return loadingViewBuilder?.call(dataOrNull) ?? const MtpLoading();
      case UiStateInitial():
        return initialViewBuilder?.call() ??
            MtpEmpty(message: this.messageOrEmpty(context));
      case UiStateEmpty():
        return emptyViewBuilder?.call(this.messageOrEmpty(context)) ??
            MtpEmpty(message: this.messageOrEmpty(context));
      case UiStateFailure():
        if (showCachedData && dataOrNull != null) {
          return successViewBuilder?.call(dataOrThrow) ?? Container();
        }

        return errorViewBuilder?.call(this as UiStateFailure<T>) ??
            MtpError(error: this as UiStateFailure<T>, onRetried: onRetried);
    }
  }

  Widget toSliverView(
    BuildContext context, {
    Widget Function(T data)? successViewBuilder,
    Widget Function()? loadingViewBuilder,
    Widget Function(UiStateFailure error)? errorViewBuilder,
    Widget Function(String message)? emptyViewBuilder,
    Widget Function()? initialViewBuilder,
    bool showCachedData = true,
    Function()? onRetried,
  }) {
    switch (this) {
      case UiStateSuccess():
        return successViewBuilder?.call((this as UiStateSuccess<T>).data) ??
            SliverToBoxAdapter(
              child: Container(),
            );
      case UiStateInProgress():
        if (showCachedData && dataOrNull != null) {
          return successViewBuilder?.call(dataOrThrow) ??
              SliverToBoxAdapter(child: Container());
        }
        return loadingViewBuilder?.call() ??
            const SliverToBoxAdapter(child: MtpLoading());
      case UiStateInitial():
        return initialViewBuilder?.call() ??
            SliverToBoxAdapter(
                child: MtpEmpty(message: this.messageOrEmpty(context)));
      case UiStateEmpty():
        return emptyViewBuilder?.call(this.messageOrEmpty(context)) ??
            SliverToBoxAdapter(
                child: MtpEmpty(message: this.messageOrEmpty(context)));
      case UiStateFailure():
        if (showCachedData && dataOrNull != null) {
          return successViewBuilder?.call(dataOrThrow) ??
              SliverToBoxAdapter(child: Container());
        }

        return errorViewBuilder?.call(this as UiStateFailure<T>) ??
            SliverToBoxAdapter(
                child: MtpError(
                    error: this as UiStateFailure<T>, onRetried: onRetried));
    }
  }

  UiState<T> map(T Function(T data) mapper) {
    switch (this) {
      case UiStateSuccess():
        return UiStateSuccess(mapper((this as UiStateSuccess<T>).data));
      default:
        return this;
    }
  }
}

extension UiStateFailureX<T> on UiStateFailure<T> {
  String resolveMessage(BuildContext context) {
    switch (type) {
      case UiFailureType.unauthorized:
        return type.message(context);
      case UiFailureType.network:
        return type.message(context);
      case UiFailureType.server:
        return type.message(context);
      case UiFailureType.client:
        return message.isNotEmpty ? message : type.message(context);
      case UiFailureType.other:
        if (message.isNotEmpty) {
          return message;
        } else {
          return type.message(context);
        }
    }
  }
}

extension UiFailureTypeX on UiFailureType {
  String message(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case UiFailureType.unauthorized:
        return l10n.errorSessionExpired;
      case UiFailureType.network:
        return l10n.errorNoInternetConnection;
      case UiFailureType.server:
        return l10n.errorUnknown;
      case UiFailureType.client:
        return l10n.errorUnknown;
      case UiFailureType.other:
        return l10n.errorUnknown;
    }
  }
}

extension ResultX<T> on Result<T> {
  UiState<T> asUiState() {
    final data = dataOrNull;
    switch (this) {
      case ResultSuccess():
        if (data is List && data.isEmpty) {
          return const UiStateEmpty();
        }

        if (data == null) {
          return const UiStateEmpty();
        }

        return UiStateSuccess(data);
      case ResultError():
        final exception = (this as ResultError<T>).exception;
        return UiStateFailure.fromException(exception);
      case ResultLoading():
        logger.d('ResultLoading: dataOrNull: $dataOrNull');
        return UiStateInProgress(dataOrNull);
    }
  }
}

/// `NullValue` is a placeholder class used in `UiState` to represent no data.
///
/// ## Purpose
/// Instead of using `null`, which can be unclear, `NullValue` clearly signifies
/// that the `UiState` does not carry any data.
///
/// ## Example:
/// ```dart
/// UiState<NullValue> refreshUiState = UiState.success(NullValue());
/// ```
///
/// This makes it clear that no data is expected in this state.
final class NullValue {
  const NullValue();
}
