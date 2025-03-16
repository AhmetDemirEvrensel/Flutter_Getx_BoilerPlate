import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/views/forgotPassword/enter_mail_view.dart';
import 'package:flutter_getx_boilerplate/modules/auth/views/login/login_view.dart';
import 'package:flutter_getx_boilerplate/modules/auth/views/register/register_success_view.dart';
import 'package:flutter_getx_boilerplate/modules/auth/views/register/verify_email_view.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstants.primaryNormal,
      body: SafeArea(
        bottom: false,
        right: false,
        left: false,
        child: Stack(
          children: [
            Obx(() {
              switch (controller.currentView.value) {
                case AuthViewType.login:
                  return const LoginView(); // Giriş
                case AuthViewType.registerSuccess:
                  return const RegisterSuccessView(); // Kayıt başarılı
                case AuthViewType.verifyEmail:
                  return const VerifyEmailView(); // Kod girme sayfasi
                case AuthViewType.enterMail:
                  return const EnterMailView(); // Mail girme sayfasi
                default:
                  return const Center(child: Text('Unknown view'));
              }
            }),
          ],
        ),
      ),
    );
  }
}
