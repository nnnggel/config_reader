library config_reader;

import 'dart:convert';

import 'package:http/http.dart' as http;

class ConfigReader {
  static Future<Map<String, String>> readProperties(String content) async {
    if (content?.isEmpty ?? true) {
      return Map<String, String>();
    }
    final propertiesMap = Map<String, String>();
    content
        .split(new RegExp(r"\n"))
        .where((line) =>
            !line.startsWith('#') &&
            line.trim().isNotEmpty &&
            line.contains('='))
        .forEach((line) {
      int idx = line.indexOf('=');
      propertiesMap.putIfAbsent(line.substring(0, idx).trim(),
          () => line.substring(idx + 1, line.length).trim());
    });

//    print('propertiesMap.keys: ${propertiesMap.keys.join(',')}');
//    print('propertiesMap.values: ${propertiesMap.values.join(',')}');

    return propertiesMap;
  }

  static Future<Map<String, String>> readOnlineProperties(String url) async {
    return readProperties(await _getUrlContent(url));
  }

  static Future<Map<String, dynamic>> readJson(String content) async {
    if (content?.isEmpty ?? true) {
      return Map<String, dynamic>();
    }
    return jsonDecode(content);
  }

  static Future<Map<String, dynamic>> readOnlineJson(String url) async {
    return readJson(await _getUrlContent(url));
  }

  static Future<String> _getUrlContent(String url) async {
    if (url?.isEmpty ?? true) {
      return '';
    }
    String content;
    try {
      content = Utf8Decoder().convert(await http.readBytes(url));
//      print('content: $content');
    } catch (e) {
      throw e;
    }
    return content;
  }
}
