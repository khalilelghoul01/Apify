import 'dart:convert';

import 'http_status.dart';

class Response {
  HttpStatus _status = HttpStatus.OK;
  bool _next = false;
  bool get canNext => _next;
  final Map<String, String> _headers = {
    'Content-Type': 'text/html',
    'charset': 'utf-8',
    'Access-Control-Allow-Origin': '*',
    'server': 'ApiFy Dart Server',
  };
  String _body = '';

  Response next() {
    _next = true;
    return this;
  }

  Response status(int code) {
    _status = StatusImp.getStatus(code);
    return this;
  }

  Response header(String key, String value) {
    _headers[key] = value;
    return this;
  }

  Response headers(Map<String, String> headers) {
    _headers.addAll(headers);
    return this;
  }

  Response send(String body) {
    _body = body;
    // _headers['Content-Length'] = _body.length.toString();
    return this;
  }

  Response json(Map<String, dynamic> json) {
    var current = headers({'Content-Type': 'application/json'});
    return current.send(jsonEncode(json));
  }

  Response html(String body) {
    var current = headers({'Content-Type': 'text/html'});
    return current.send(body);
  }

  Response text(String body) {
    var current = headers({'Content-Type': 'text/plain'});
    return current.send(body);
  }

  Response jsonp(String body) {
    var current = headers({'Content-Type': 'application/javascript'});
    return current.send(body);
  }

  Response redirect(String url) {
    var current = headers({'Location': url});
    return current.status(HttpStatus.MOVED_PERMANENTLY.code);
  }

  String response() {
    var status = StatusImp.getStatus(_status.code);
    var headers = _headers.entries.map((e) => '${e.key}: ${e.value}');
    var response = <String>[];
    response.add('HTTP/1.1 ${status.code} ${status.message}');
    response.addAll(headers);
    response.add('');
    response.add('');
    response.add('');
    response.add(_body);
    return response.join('\r\n');
  }

  dump() {
    (response());
  }
}
