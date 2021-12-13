import 'package:http/http.dart';
import 'dart:io';
import 'dart:async';

class HttpClient {

  static const _api = "run.mocky.io/v3/7bbc6148-ba08-4722-96d3-096b35b67fb4";
  final _contentType = "application/json";
  static const successCodes = [200, 204];

  Future<Response> getRequest(String path, { String url = _api, Map<String, String> queryParameters } ) {
    return get(Uri.https(url, path, queryParameters));
  }

  Future<Response> postRequest(String path, Object body, { String url = _api, bool isJson = true } ) {
    return post(
      Uri.https(url, path),
      headers: isJson ? { HttpHeaders.contentTypeHeader: _contentType } : null,
      body: body
    );
  }

  Future<Response> putRequest(String path, Object body, { String url = _api, bool isJson = true } ) {
    return put(
      Uri.https(url, path),
      headers: isJson ? { HttpHeaders.contentTypeHeader: _contentType } : null,
      body: body
    );
  }

}