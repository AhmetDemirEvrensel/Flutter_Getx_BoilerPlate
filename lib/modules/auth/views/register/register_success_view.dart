import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/controller/auth_controller.dart';
import 'package:flutter_getx_boilerplate/routes/app_pages.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_button.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_text.dart';
import 'package:get/get.dart';

class RegisterSuccessView extends GetView<AuthController> {
  const RegisterSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/welcome.png'), // Görüntü dosyasını belirtiyoruz
          fit: BoxFit.cover, // Görüntünün tüm alanı kaplamasını sağlıyoruz
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Image.asset('assets/images/welcomehome.png'),
                  const SizedBox(
                    height: 30,
                  ),
                  const BpText.base(
                    'Merhabalar!\nHoş Geldiniz',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BpText.base(
                    'Kayıt olduğunuz için teşekkür ederiz, Toplu veya \nBireysel ürünlerdeki indirimlerden yararlanın.',
                    textAlign: TextAlign.center,
                    color: ColorConstants.tfHintColor,
                  ),
                  const Spacer(),
                  _buildSubmitButton(context),
                  const SizedBox(
                    height: 22,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return BpButton(
      'Pazar Yerini Keşfedin',
      onTap: () async {
        final controller = Get.find<AuthController>();
        controller.clearFormData();
        controller.currentView.value = AuthViewType.login;
        controller.isRegisterMode.value = false;
        // Get.offAllNamed(Routes.LOGIN);
      },
      textColor: Colors.white,
    );
  }
}
