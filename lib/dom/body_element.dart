import 'package:http_server/dom/dom.dart';

class Body extends Element {
  Body({List<Element>? children}) {
    tag = 'body';
    if (children != null) {
      this.children = children;
    }
  }
}
