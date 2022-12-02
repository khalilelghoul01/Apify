import 'package:http_server/dom/base_element.dart';

class Img extends Element {
  Img({
    required String src,
    String? alt,
    int? width,
    int? height,
    String? id,
    String? classes,
  }) {
    setAttribute("src", src);

    if (alt != null) {
      setAttribute("alt", alt);
    }
    if (width != null) {
      setAttribute("width", width.toString());
    }
    if (height != null) {
      setAttribute("height", height.toString());
    }
    if (id != null) {
      setId(id);
    }
  }

  @override
  String getHtml() {
    return "<img ${getAttributes()} >";
  }
}
