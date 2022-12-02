// ignore: file_names
// ignore_for_file: constant_identifier_names, unused_local_variable, depend_on_referenced_packages

import 'dart:core';
import 'dart:io';
import 'package:ansicolor/ansicolor.dart';
import 'package:http_server/types/global.dart';
import 'classes/classes.dart';
export 'classes/classes.dart';

class ApiFy {
  ServerSocket? _serverSocket;
  Map<String, Route> routes = {};
  Map<String, List<Middleware>> middlewares = {};

  void route(String path, HttpMethod method, RequestCallback callback) {
    routes[path] = Route(path, method, (req, res) {
      if (middlewares["onRequest"] != null) {
        for (var middleware in middlewares["onRequest"]!) {
          middleware.callback(req, res);
          if (!res.canNext) {
            return;
          }
        }
      }
      callback(req, res);
    });
  }

  void get(String path, RequestCallback callback) {
    route(path, HttpMethod.GET, (req, res) {
      if (middlewares["onGet"] != null) {
        for (var middleware in middlewares["onGet"]!) {
          middleware.callback(req, res);
          if (!res.canNext) {
            return;
          }
        }
      }
      callback(req, res);
    });
  }

  void post(String path, RequestCallback callback) {
    route(path, HttpMethod.POST, (req, res) {
      if (middlewares["onPost"] != null) {
        for (var middleware in middlewares["onPost"]!) {
          middleware.callback(req, res);
          if (!res.canNext) {
            return;
          }
        }
      }

      callback(req, res);
    });
  }

  void put(String path, RequestCallback callback) {
    route(path, HttpMethod.PUT, (req, res) {
      if (middlewares["onPut"] != null) {
        for (var middleware in middlewares["onPut"]!) {
          middleware.callback(req, res);
          if (!res.canNext) {
            return;
          }
        }
      }
      callback(req, res);
    });
  }

  void delete(String path, RequestCallback callback) {
    route(path, HttpMethod.DELETE, (req, res) {
      if (middlewares["onDelete"] != null) {
        for (var middleware in middlewares["onDelete"]!) {
          middleware.callback(req, res);
          if (!res.canNext) {
            return;
          }
        }
      }
      callback(req, res);
    });
  }

  void close() {
    _serverSocket?.close();
  }

  // ignore: non_constant_identifier_names
  Future<void> start(int PORT, {Function? callback}) async {
    // cleanup
    print("\x1B[2J\x1B[0;0H");

    ProcessSignal.sigint.watch().listen((signal) {
      close();
      exit(0);
    });
    try {
      _serverSocket = await ServerSocket.bind(InternetAddress.anyIPv4, PORT);
      if (callback != null) {
        callback();
      }

      _serverSocket!.listen((Socket socket) {
        socket.listen((List<int> data) {
          var payload = String.fromCharCodes(data);
          var request = Request.fromString(payload);
          var response = Response();
          var currentRoute = routes[request.path];
          AnsiPen yellow = AnsiPen()..yellow(bold: true);
          AnsiPen red = AnsiPen()..red(bold: true);
          AnsiPen green = AnsiPen()..green(bold: true);
          AnsiPen white = AnsiPen()..white(bold: true);
          print(green('Request:') +
              yellow(
                  ' ${request.method.toString().replaceFirst("HttpMethod.", "")}') +
              white(' ${request.path}'));
          if (currentRoute != null) {
            if (currentRoute.method == request.method) {
              if (request.method == HttpMethod.POST) {}
              currentRoute.callback(request, response);
              socket.write(response.response());
              socket.close();
            } else {
              response.status(405).json({
                'message': 'Method not allowed',
              });
              socket.write(response.response());
              socket.close();
            }
          } else {
            response.status(404).json({
              'message': 'Not found',
            });
            socket.write(response.response());
            socket.close();
          }
        });
      });
    } catch (e) {
      ('Server start error: $e');
    }
  }

  onRequest(MiddlewareCallback callback) {
    middlewares['onRequest'] = [
      if (middlewares['onRequest'] != null) ...middlewares['onRequest']!,
      Middleware('*', callback)
    ];
  }

  onGet(MiddlewareCallback callback) {
    middlewares['onGet'] = [
      if (middlewares['onGet'] != null) ...middlewares['onGet']!,
      Middleware('*', callback)
    ];
  }

  onPost(MiddlewareCallback callback) {
    middlewares['onPost'] = [
      if (middlewares['onPost'] != null) ...middlewares['onPost']!,
      Middleware('*', callback)
    ];
  }

  onPut(MiddlewareCallback callback) {
    middlewares['onPut'] = [
      if (middlewares['onPut'] != null) ...middlewares['onPut']!,
      Middleware('*', callback)
    ];
  }

  onDelete(MiddlewareCallback callback) {
    middlewares['onDelete'] = [
      if (middlewares['onDelete'] != null) ...middlewares['onDelete']!,
      Middleware('*', callback)
    ];
  }
}
