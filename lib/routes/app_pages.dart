import 'package:flutter_getx_boilerplate/modules/auth/binding/auth_binding.dart';
import 'package:flutter_getx_boilerplate/modules/auth/views/auth_view.dart';
import 'package:flutter_getx_boilerplate/modules/splash/splash_binding.dart';
import 'package:flutter_getx_boilerplate/modules/splash/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
