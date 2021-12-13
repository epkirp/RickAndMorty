import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:domain/exceptions.dart';

// todo подумать над тем, как сделать красиво обработку ошибок (чтобы при Unknown ошибках можно вывести текст)
class ApiRequestHandler {
  static Future<E> sendRequest<E>({
    required Future<Response<dynamic>> request,
    required E Function(Map<String, dynamic>) converter,
  }) async {
    final hasConnect = await _hasInternetConnectivity();
    if (hasConnect) {
      try {
        final Response response = await request;

        if (!response.statusCode.toString().startsWith('2')) {
          throw handleError(errorResponse: response);
        } else {
          return converter(response.data);
        }
      } on DioError catch (e) {
        throw handleError(dioError: e);
      } catch (e) {
        throw UnknownError(errorMessage: e.toString());
      }
    } else {
      throw NoInternetConnection();
    }
  }

  static Never handleError({Response<dynamic>? errorResponse, DioError? dioError}) {
    if (dioError?.type == DioErrorType.connectTimeout ||
        dioError?.type == DioErrorType.receiveTimeout ||
        dioError?.type == DioErrorType.sendTimeout) {
      throw TimeoutError();
    }

    final Response<dynamic>? error = (errorResponse != null) ? errorResponse : dioError?.response;

    if (error == null) {
      throw UnknownError();
    }

    switch (error.statusCode) {
      case 500:
      case 502:
        throw ServiceUnavailable();
      default:
        throw UnknownError(errorMessage: error.statusMessage);
    }
  }

  static Future<bool> _hasInternetConnectivity() async {
    // todo не чекается реальный коннект к интернету, нужно пинговать может быть
    // todo Connectivity нужно сделать через di
    final ConnectivityResult hasConnection = await Connectivity().checkConnectivity();

    return hasConnection != ConnectivityResult.none;
  }
}
