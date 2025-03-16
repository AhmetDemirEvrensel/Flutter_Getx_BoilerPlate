import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/controller/auth_controller.dart';
import 'package:flutter_getx_boilerplate/modules/auth/views/forgotPassword/enter_code_view.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/auth_textfield.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/auth_title.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_button.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EnterMailView extends GetView<AuthController> {
  const EnterMailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryNormal,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: _buildHeader(context),
          ),
          Expanded(
            flex: 3,
            child: _buildContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const HeaderWithOptionalSubtitle(
        title: 'Şifremi Unuttum',
        subtitle:
            'Email adresinize 4 haneli doğrulama kodu göndermek için mail adresinizi aşağıya giriniz.');
  }

  Widget _buildContent(BuildContext context) {
    return ReactiveForm(
      formGroup: controller.form.control('forgotPassword') as FormGroup,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Expanded(
                child: Column(
                  children: [
                    AuthTextField(
                      prefixIcon: Icons.mail_outline,
                      hint: 'E-Posta Adresiniz',
                      formControlName: 'email',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BpButton(
                      'Kodu Gönder',
                      onTap: () async{
                        Get.to(const EnterCodeView());
                      },
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
