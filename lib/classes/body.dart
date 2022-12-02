import 'dart:convert';

import 'package:http_server/Apify.dart';

class Body {
  String rawbody;
  Map<String, dynamic> json = {};
  Body(
    this.rawbody,
  ) {
    var jsonRegexp = RegExp(r'(?<=\{)(.*)(?=\})');
    var firstMatch = jsonRegexp.firstMatch(rawbody);
    if (firstMatch != null) {
      var jsonStr = firstMatch.group(0);
      if (jsonStr != null) {
        json = jsonDecode(jsonStr);
      }
    }
  }
}
