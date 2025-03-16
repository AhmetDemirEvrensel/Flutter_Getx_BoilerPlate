import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/auth_title.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/password_textField.dart';
import 'package:get/get.dart';

import 'package:flutter_getx_boilerplate/modules/auth/controller/auth_controller.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class NewPassword extends GetView<AuthController> {
  const NewPassword({super.key});

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
        title: 'Yeni Şifre Oluştur',
        subtitle:
            'Yeni şifreniz daha önce kullandığınız şifrelerden farklı olmalıdır.s');
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ReactiveForm(
        formGroup: controller.form.control('forgotPassword') as FormGroup,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Expanded(
                child: Column(
                  children: [
                    const PasswordTextfield(
                      hint: 'Şifre',
                      formControlName: 'password',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const PasswordTextfield(
                      hint: 'Şifre Tekrar',
                      formControlName: 'passwordAgain',
                    ),
                    const Spacer(),
                    BpButton(
                      'Kaydet',
                      onTap: () async {
                        // Get.to(const RegisterSuccessView());
                      },
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 30,
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
