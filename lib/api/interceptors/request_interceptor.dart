import 'dart:async';
import 'dart:convert';

import 'package:flutter_getx_boilerplate/services/storage_service.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> requestInterceptor(request) async {
  print('🌐 Request URL --> ${request.url}');
  print('📤 Request Method --> ${request.method}');

  final token = StorageService.to.token;
  final deviceId = StorageService.to.deviceId;
  final nst = StorageService.to.nst;

  // Add required headers from Postman collection
  if (token != null && token.isNotEmpty) {
    request.headers['Token'] = token;
  }
  
  request.headers['Accept'] = 'application/json';
  request.headers['Content-Type'] = 'application/json';
  request.headers['DeviceId'] = deviceId;
  request.headers['NST'] = nst;
  request.headers['User-Agent'] = 'com.bs.ecommerce/1.0';

  // Properly handle request body logging
  if (request.method != 'GET') {
    try {
      final bodyStr = jsonEncode(request.body);
      print('📤 Request Body --> $bodyStr');
    } catch (e) {
      print('📤 Request Body --> Unable to encode body: $e');
    }
  }

  print('📤 Request Headers --> ${request.headers}');

  return request;
}
