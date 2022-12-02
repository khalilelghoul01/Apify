import 'package:http_server/types/global.dart';

class Middleware {
  final String path;
  final MiddlewareCallback callback;

  Middleware(this.path, this.callback);
}
