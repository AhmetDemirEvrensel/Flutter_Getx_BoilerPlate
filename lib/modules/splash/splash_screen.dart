import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_text.dart';
import 'package:get/get.dart';

import './splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: BpText.h3Semibold('Borderplate 🚀'),
        ),
      ),
    );
  }
}
