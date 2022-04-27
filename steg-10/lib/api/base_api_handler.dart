import 'package:progit_activity_booker/services/http_service.dart';

const useLocalFunctions = false;

const url = 'https://europe-west1-progit-social.cloudfunctions.net/app';

class BaseApiHandler {
  final String basePath;
  final client = HttpService.instance;

  BaseApiHandler(String? basePath) : basePath = '$url$basePath';

  String getUrl({String? path, List<String>? paths}) {
    if (path == null && paths == null) {
      return basePath;
    } else if (paths == null) {
      return '$basePath/$path';
    } else {
      final joinedPaths = paths.join('/');
      return '$basePath/$joinedPaths';
    }
  }

  Future<T> get<T>(String? url) {
    var _url = url ?? getUrl();
    return client.doRequest(url: _url);
  }

  Future<T> post<T>({String? url, Map<String, dynamic> body = const {}}) {
    var _url = url ?? getUrl();
    return client.doRequest(
        url: _url, requestMethod: REQUEST_METHODS.POST, body: body);
  }
}
