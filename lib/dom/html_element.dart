import 'package:http_server/dom/dom.dart';

class Html extends Element {
  Html({List<Element>? children}) {
    tag = 'html';
    if (children != null) {
      this.children = children;
    }
  }
}
