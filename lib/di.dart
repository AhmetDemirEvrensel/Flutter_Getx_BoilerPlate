import 'package:flutter_getx_boilerplate/api/api.dart';
import 'package:flutter_getx_boilerplate/modules/auth/controller/auth_controller.dart';
import 'package:flutter_getx_boilerplate/services/storage_service.dart';
import 'package:get/get.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    
    // API bağımlılıkları
    Get.put(ApiProvider(), permanent: true);
    Get.put(ApiRepository(apiProvider: Get.find()), permanent: true);
    
    // Controller'lar
    Get.put(AuthController(), permanent: true);
  }
}
