import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_boilerplate/app_binding.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_boilerplate/di.dart';
import 'package:flutter_getx_boilerplate/routes/routes.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:scaled_app/scaled_app.dart';

void main() async {
  ScaledWidgetsFlutterBinding.ensureInitialized(
    scaleFactor: (deviceSize) {
      const double widthOfDesign = 375;
      if (deviceSize.width > widthOfDesign) return 1;
      return deviceSize.width / widthOfDesign;
    },
  );

  await DenpendencyInjection.init();

  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static const _mobileWidthThreshold = 500;
  static const _mobileWidth = 420.0;
  static const _mobileHeight = 900.0;

  bool _hasFrame = false;

  bool get _checkSize => !GetPlatform.isMobile || GetPlatform.isWeb;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX Boilerplate',
      enableLog: true,
      initialRoute: Routes.SPLASH,
      initialBinding: AppBinding(),
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      smartManagement: SmartManagement.keepFactory,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.lightGray),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      scrollBehavior: AppScrollBehavior(),
      builder: EasyLoading.init(
        builder: (context, widget) {
          if (_checkSize) {
            final size = MediaQuery.of(context).size;
            final hasFrame = size.width > _mobileWidthThreshold;
            if (hasFrame) {
              return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: _buildFrame(widget!));
            }
          }
          return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: widget!);
        },
      ),
    );
  }

  @override
  void didChangeMetrics() {
    if (_checkSize) {
      final size = Get.size;
      final hasFrame = size.width > _mobileWidthThreshold;
      if (_hasFrame != hasFrame) {
        setState(() {
          _hasFrame = hasFrame;
        });
      }
    }
  }

  Widget _buildFrame(Widget app) {
    return Builder(builder: (context) {
      return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          body: Center(
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(vertical: 16),
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                height: _mobileHeight,
                width: _mobileWidth,
                child: app,
              ),
            ),
          ));
    });
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..radius = 10.0
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = hexToColor('#64DEE0')
    ..textColor = hexToColor('#64DEE0')
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
