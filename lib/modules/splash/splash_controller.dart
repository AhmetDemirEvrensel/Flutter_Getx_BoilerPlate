import 'package:flutter/foundation.dart';
import 'package:flutter_getx_boilerplate/routes/app_pages.dart';
import 'package:flutter_getx_boilerplate/services/storage_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    Get.put(StorageService());
    await Future.delayed(const Duration(milliseconds: 2000));
    try {
      if (StorageService.to.token?.isNotEmpty ?? false) {
        debugPrint('🔑 Token var, ana sayfaya yönlendiriliyor');
        debugPrint('🔑 Token: ${StorageService.to.token}');
        // Get.offAndToNamed(Routes.MAIN);
      } else {
        debugPrint('🔑 Token yok, giriş ekranına yönlendiriliyor');
        Get.offAndToNamed(Routes.AUTH);
      }
    } catch (e) {
      // Get.offAndToNamed(Routes.MAIN);
    }
  }
}
