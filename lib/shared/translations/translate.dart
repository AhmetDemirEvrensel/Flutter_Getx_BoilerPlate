import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class KT {
  static String t(BuildContext context, String key, String defaultValue,
      {final String? fallbackKey,
      final Map<String, String>? translationParams}) {
    var q = FlutterI18n.translate(context, key,
        fallbackKey: fallbackKey, translationParams: translationParams);
    if (q == key) {
      return defaultValue;
    }
    return q;
  }

  static Map<String, dynamic> mergeJson(
      Map<String, dynamic> json1, Map<String, dynamic> json2) {
    Map<String, dynamic> merged = Map.from(json1);

    json2.forEach((key, value) {
      if (merged.containsKey(key) && merged[key] is Map && value is Map) {
        merged[key] = mergeJson(merged[key], value as Map<String, dynamic>);
      } else {
        merged[key] = value;
      }
    });

    return merged;
  }

  static String getJsonFileContent(String fileName) {
    final file = File(fileName);
    if (file.existsSync()) {
      return file.readAsStringSync();
    } else {
      return '{}';
    }
  }

  static void saveDataToJsonFile(String fileName, String data) async {
    final file = File(fileName);

    file.writeAsStringSync(data);
  }
}
