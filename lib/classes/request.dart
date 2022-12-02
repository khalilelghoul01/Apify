import 'package:http_server/classes/body.dart';

import 'http_methods.dart';

class Request {
  late HttpMethod method;
  String path;
  String version;
  Map<String, String> headers;
  Body body;

  Request(String method, this.path, this.version, this.headers, this.body) {
    this.method = HttpMethod.values
        .firstWhere((element) => element.toString() == 'HttpMethod.$method');
  }

  static Request fromString(String payload) {
    var request = payload.split('\r\n');
    var requestLine = request[0].split(' ');
    var method = requestLine[0];
    var path = requestLine[1];
    var version = requestLine[2];
    Map<String, String> headers = {};
    for (int i = 1; i < request.length; i++) {
      var header = request[i].split(': ');
      if (header.length == 2) {
        headers[header[0]] = header[1];
      }
    }
    if (method == 'POST') {
      var body = Body(request[request.length - 1]);
      return Request(method, path, version, headers, body);
    }
    return Request(method, path, version, headers, Body(''));
  }

  @override
  String toString() {
    return '$method $path $version $headers';
  }

  dump() {
    ('''
    Method: $method
    Path: $path
    Version: $version
    Headers: $headers
    Body: $body
''');
  }
}
