import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String url;
  final String message;
  final int? statusCode;
  final Response? response;

  ApiException({
    required this.url,
    required this.message,
    this.response,
    this.statusCode,
  });

  @override
  String toString() {
    String result = '';

    // 1. Öncelikle 'details' alanını kontrol et (array olabilir)
    var details = response?.data?['details'];
    if (details is List) {
      result = details.join(', '); // Eğer listeyse, virgülle ayırarak birleştir
    } else {
      // 2. Eğer 'details' yoksa veya uygun değilse, 'message' veya 'error' alanını kontrol et
      result = response?.data?['message'] ??
          response?.data?['error'] ??
          'Lütfen yetkili birimlerle iletişime geçiniz';
    }

    // 3. Eğer result hala boşsa, en son olarak `message` değişkenini ekle
    if (result.isEmpty) {
      result = message; // Bu, Dio'dan gelen genel hata mesajı olabilir
    }

    return result;
  }
}
