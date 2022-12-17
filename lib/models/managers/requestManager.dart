import 'package:dio/dio.dart';

class RequestManager {
  String baseApiUrl; // TODO: créer une classe AppConfig et définir ça en constante + setUp les environnements
  Dio dio;

  //  TODO: implementer interceptor pour logger les requêtes et les responses, ainsi que de gérer les erreurs

  RequestManager({required this.baseApiUrl, required this.dio});

  Future<dynamic> get(
    String queryUrl,
    Map<String, dynamic>? queryParameters,
  ) async {
    final String completedQueryUrl = baseApiUrl + queryUrl;
    final Response response = await dio.get(completedQueryUrl, queryParameters: queryParameters);
    return response.data;
  }

  Future<dynamic> post(
    String queryUrl,
    dynamic data, {
    bool isJson = false,
  }) async {
    final String completedQueryUrl = baseApiUrl + queryUrl;
    if (isJson) {
      dio.options.headers.addAll({"content-type": "application/json"});
    } else {
      dio.options.headers.removeWhere((key, value) => key == "content-type");
    }
    final Response response = await dio.post(completedQueryUrl, data: data);
    return response.data;
  }

  Future<dynamic> put(
    String queryUrl,
    dynamic data, {
    bool isJson = false,
  }) async {
    final String completedQueryUrl = baseApiUrl + queryUrl;
    if (isJson) {
      dio.options.headers.addAll({"content-types": "application/json"});
    } else {
      dio.options.headers.removeWhere((key, value) => key == "content-type");
    }
    final Response response = await dio.put(completedQueryUrl, data: data);
    return response.data;
  }

  Future<dynamic> patch(
    String queryUrl,
    dynamic data, {
    bool isJson = false,
  }) async {
    final String completedQueryUrl = baseApiUrl + queryUrl;
    if (isJson) {
      dio.options.headers.addAll({"content-types": "application/json"});
    } else {
      dio.options.headers.removeWhere((key, value) => key == "content-type");
    }
    final Response response = await dio.patch(completedQueryUrl, data: data);
    return response.data;
  }

  Future<dynamic> delete(
    String queryUrl,
    dynamic data, {
    bool isJson = false,
  }) async {
    final String completedQueryUrl = baseApiUrl + queryUrl;
    final Response response = await dio.delete(completedQueryUrl, data: data);
    return response.data;
  }
}
