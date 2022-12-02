class Element {
  String tag;
  List<String> classes = [];
  Map<String, String> attributes = {};
  List<Element> children;

  Element(
      {this.tag = 'Element',
      List<String>? classes,
      Map<String, String>? attributes,
      this.children = const []}) {
    if (classes != null) {
      this.classes = classes;
    }
    if (attributes != null) {
      this.attributes = attributes;
    }
  }

  Element addClass(String className) {
    if (className.isEmpty) return this;
    if (className.contains(' ')) {
      classes.addAll(className.split(' '));
    } else {
      classes.add(className);
    }
    return this;
  }

  Element removeClass(String className) {
    if (className.isEmpty) return this;
    if (className.contains(' ')) {
      classes.removeWhere((element) => className.split(' ').contains(element));
    } else {
      classes.remove(className);
    }
    return this;
  }

  Element setAttribute(String key, String value) {
    attributes[key] = value;
    return this;
  }

  Element setAttributes(Map<String, String> attributes) {
    this.attributes.addAll(attributes);
    return this;
  }

  Element removeAttribute(String key) {
    attributes.remove(key);
    return this;
  }

  Element setId(String id) {
    return setAttribute('id', id);
  }

  String getAttribute(String key) {
    return attributes[key] ?? '';
  }

  String getAttributes() {
    var attributes = <String>[];
    this.attributes.forEach((key, value) {
      attributes.add('$key="$value"');
    });
    return attributes.join(' ');
  }

  String getClasses() {
    return classes.join(' ');
  }

  String getHtml() {
    var html = <String>[];
    html.add('<$tag');
    if (classes.isNotEmpty) html.add(' class="${getClasses()}"');
    if (attributes.isNotEmpty) html.add(' ${getAttributes()}');
    html.add('>');
    for (var element in children) {
      html.add(element.getHtml());
    }
    html.add('</$tag>');
    return html.join('');
  }

  @override
  String toString() {
    return getHtml();
  }
}
