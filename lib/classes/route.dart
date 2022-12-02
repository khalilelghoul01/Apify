import 'package:http_server/types/global.dart';

import 'classes.dart';

class Route {
  String path;
  HttpMethod method;
  RequestCallback callback;

  Route(this.path, this.method, this.callback);
}
