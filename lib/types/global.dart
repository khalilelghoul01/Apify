import '../classes/classes.dart';

typedef RequestCallback = void Function(Request req, Response res);
typedef MiddlewareCallback = void Function(Request req, Response res);
