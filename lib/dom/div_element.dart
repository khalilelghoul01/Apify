import 'package:http_server/dom/dom.dart';

class Div extends Element {
  Div(
      {List<Element>? children,
      List<String>? classes,
      Map<String, String>? attributes}) {
    tag = 'div';
    if (children != null) {
      this.children = children;
    }
    if (classes != null) {
      this.classes = classes;
    }
    if (attributes != null) {
      this.attributes = attributes;
    }
  }
}
