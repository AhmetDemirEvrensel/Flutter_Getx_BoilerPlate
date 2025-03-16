import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  print('📥 Response Status --> ${response.statusCode}');
  print('📥 Response Headers --> ${response.headers}');

  // Properly handle response body logging
  try {
    if (response.body != null) {
      final bodyStr =
          response.body is String ? response.body : jsonEncode(response.body);
      print('📥 Response Body --> $bodyStr');
    }
  } catch (e) {
    print('📥 Response Body --> Unable to encode body: $e');
  }

  if (response.unauthorized) {
    print('❌ Unauthorized Request');
  } else if (response.isOk) {
    print('✅ Request Successful');
  } else {
    print('❌ Request Failed: ${response.statusText}');
  }

  return response;
}
