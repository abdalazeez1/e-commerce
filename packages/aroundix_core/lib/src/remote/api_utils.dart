import 'dart:async';
import 'dart:developer';
import 'dart:io';

import '../exceptions/exceptions.dart';
import 'result/api_result.dart';

Future<T> throwAppException<T>(FutureOr<T> Function() call) async {
  try {
    return (await call());
  } on AppException catch (_) {
    rethrow;
  }
  // on FirebaseException catch (e) {
  //   throw AppNetworkResponseException(
  //       exception: e, data: e.message ?? 'unknown exception');
  // }
  on SocketException catch (e) {
    throw AppNetworkException(
        message: e.message,
        reason: AppNetworkExceptionReason.noInternet,
        exception: e);
  } on Exception catch (e) {
    throw AppException.unknown(
      exception: e,
      message: e.toString()
    );
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    throw AppException.unknown(exception: e, message: e.toString());
  }
}

Future<ApiResult<T>> toApiResult<T>(FutureOr<T> Function() call,
    {String prefix = 'exceptions.'}) async {
  try {
    return ApiResult.success(data: await call());
  } on AppNetworkResponseException catch (e) {
    if (e.data is! String) {
      return ApiResult.failure(
        message: e.message,
        exception: e,
      );
    }
    return ApiResult.failure(
      message: e.message,
      exception: e,
    );
  } on AppNetworkException catch (e) {
    final message = e.message;
    final appNetworkException = e.copyWith(message: message);
    return ApiResult.failure(
      message: message,
      exception: appNetworkException,
    );
  } on AppException catch (e) {
    return ApiResult.failure(
      exception: e,
      message: e.message,
    );
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    final exception = AppException.unknown(
      exception: e,
      message: e.toString()
    );
    return ApiResult.failure(
      exception: exception,
      message: exception.message,
    );
  }
}
