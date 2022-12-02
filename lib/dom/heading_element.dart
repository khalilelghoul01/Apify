import 'package:http_server/dom/dom.dart';

class Heading extends Element {
  String text = '';
  Heading(
      {String tag = 'h1',
      String? text,
      List<String>? classes,
      String? id,
      Map<String, String>? attributes}) {
    this.tag = tag;
    if (id != null) {
      setId(id);
    }
    if (text != null) {
      this.text = text;
    }
    if (classes != null) {
      this.classes = classes;
    }
    if (attributes != null) {
      this.attributes = attributes;
    }
  }

  @override
  String getHtml() {
    var html = <String>[];
    html.add('<$tag');
    if (classes.isNotEmpty) html.add(' class="${getClasses()}"');
    if (attributes.isNotEmpty) html.add(' ${getAttributes()}');
    html.add('>');
    html.add(text);
    html.add('</$tag>');
    return html.join('');
  }
}

class H1 extends Heading {
  H1({String? text, List<String>? classes, Map<String, String>? attributes})
      : super(tag: 'h1', text: text, classes: classes, attributes: attributes);
}

class H2 extends Heading {
  H2({String? text, List<String>? classes, Map<String, String>? attributes})
      : super(tag: 'h2', text: text, classes: classes, attributes: attributes);
}

class H3 extends Heading {
  H3({String? text, List<String>? classes, Map<String, String>? attributes})
      : super(tag: 'h3', text: text, classes: classes, attributes: attributes);
}

class H4 extends Heading {
  H4({String? text, List<String>? classes, Map<String, String>? attributes})
      : super(tag: 'h4', text: text, classes: classes, attributes: attributes);
}

class H5 extends Heading {
  H5({String? text, List<String>? classes, Map<String, String>? attributes})
      : super(tag: 'h5', text: text, classes: classes, attributes: attributes);
}

class H6 extends Heading {
  H6({String? text, List<String>? classes, Map<String, String>? attributes})
      : super(tag: 'h6', text: text, classes: classes, attributes: attributes);
}

class P extends Heading {
  P({String? text, List<String>? classes, Map<String, String>? attributes})
      : super(tag: 'p', text: text, classes: classes, attributes: attributes);
}

class Span extends Heading {
  Span({String? text, List<String>? classes, Map<String, String>? attributes})
      : super(
            tag: 'span', text: text, classes: classes, attributes: attributes);
}
