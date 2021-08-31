import 'package:dio/dio.dart';

class DioSettings {
  final String token;
  DioSettings({this.token = ''}) {
    token.isEmpty ? getLoginSettings() : getCardsSettings();
  }
  static final mainServer = "https://trello.backend.tests.nekidaem.ru/api/v1/";

  Dio dio = Dio(BaseOptions(
    baseUrl: mainServer,
    connectTimeout: 10000,
    receiveTimeout: 10000,
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
  ));

  getLoginSettings() {
    Interceptors interceptors = dio.interceptors;

    interceptors.requestLock.lock();

    interceptors.clear();
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (response, handler) {
          return handler.next(response);
        },
      ),
    );
    interceptors.requestLock.unlock();
  }

  getCardsSettings() {
    Interceptors interceptors = dio.interceptors;

    interceptors.requestLock.lock();

    interceptors.clear();
    dio.options.headers['Authorization'] =
        'JWT $token';
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (response, handler) {
          return handler.next(response);
        },
      ),
    );
    interceptors.requestLock.unlock();
  }
}
