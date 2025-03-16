import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/controller/auth_controller.dart';
import 'package:flutter_getx_boilerplate/modules/auth/views/forgotPassword/enter_mail_view.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/auth_checkbox.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/auth_textfield.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/auth_title.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/password_textField.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_button.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_text.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildHeader(context),
        ),
        Expanded(
          flex: 3,
          child: _buildContent(context),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const HeaderWithOptionalSubtitle(
      text: false,
    );
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
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      controller.isRegisterMode.value
                          ? buildRegisterText()
                          : buildLoginText(),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildToggleButtons(),
                      const SizedBox(height: 20),
                      _buildDynamicTextField(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Column buildRegisterText() {
    return const Column(
      children: [
        BpText.h3Semibold(
          'Kayıt Ol',
        ),
        BpText.base('Kayıt formunu doldurun')
      ],
    );
  }

  Column buildLoginText() {
    return const Column(
      children: [
        BpText.h3Semibold('Merhaba'),
        BpText.base(
          'Giriş yap veya kayıt ol, indirimleri kaçırma..',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildToggleButtons() {
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              // Giriş Yap Butonu
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: !controller.isRegisterMode.value
                        ? ColorConstants.primaryNormal
                        : Colors.grey.shade100,
                    foregroundColor: !controller.isRegisterMode.value
                        ? Colors.white
                        : Colors.grey.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    controller.isRegisterMode.value = false;
                  },
                  child: const Text(
                    "Giriş Yap",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Kayıt Ol Butonu
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: controller.isRegisterMode.value
                        ? ColorConstants.primaryNormal
                        : Colors.grey.shade100,
                    foregroundColor: controller.isRegisterMode.value
                        ? Colors.white
                        : Colors.grey.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    controller.isRegisterMode.value = true;
                  },
                  child: const Text(
                    "Kayıt Ol",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildDynamicTextField() {
    return controller.isRegisterMode.value ? buildRegister() : buildLogin();
  }

  Widget buildRegister() {
    return ReactiveForm(
      formGroup: controller.form.control('register') as FormGroup,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthTextField(
              prefixIcon: Icons.person_2_outlined,
              hint: 'Ad Soyad',
              formControlName: 'name',
            ),
            const SizedBox(
              height: 10,
            ),
            AuthTextField(
              prefixIcon: Icons.mail_outline_outlined,
              hint: 'E-Posta Adresiniz',
              formControlName: 'email',
            ),
            const SizedBox(
              height: 10,
            ),
            /*AuthTextField(
              prefixIcon: Icons.phone_outlined,
              hint: 'Telefon Numaranız (opsiyonel)',
              formControlName: 'phoneNumber',
            ),*/
            const PasswordTextfield(
              formControlName: 'password',
              hint: 'Şifre',
            ),
            const SizedBox(
              height: 20,
            ),
            const AuthReactiveCheckbox(
              text:
                  'Kullanım Şartları ve Gizlilik Politikasını kabul ediyorum. ',
              highlightedIndexes: [0, 1, 3, 4],
              formControlName: 'termsAccepted',
            ),
            const SizedBox(
              height: 10,
            ),
            const AuthReactiveCheckbox(
              text:
                  'Tarafıma avantajlı tekliflerin sunulabilmesi amacıyla kişisel verilerimin işlenmesine yönelik aydınlatma menini okudum ve anladım. ',
              highlightedIndexes: [9, 10],
              formControlName: 'explanatoryText',
            ),
            const SizedBox(
              height: 15,
            ),
            BpButton(
              'KAYIT OL',
              onTap: () async {
                final termsAcceptedControl =
                    controller.form.control('register.termsAccepted');
                final explanatoryTextControl =
                    controller.form.control('register.explanatoryText');

                if (controller.form.control('register').valid) {
                  // await controller.register();
                } else {
                  // Checkbox'lar kontrol ediliyor
                  if (!termsAcceptedControl.valid) {
                    Get.snackbar(
                      'Hata',
                      'Kullanıcı ve gizlilik sözleşmesini kabul etmelisiniz.',
                    );
                  } else if (!explanatoryTextControl.valid) {
                    Get.snackbar(
                      'Hata',
                      'Tarafıma avantajlı tekliflerin sunulabilmesi amacıyla kişisel verilerimin işlenmesine yönelik aydınlatma menini okudum ve anladım.',
                    );
                  }

                  // Tüm kontrolleri dokunulmuş olarak işaretle
                  controller.form.control('register').markAllAsTouched();
                }
              },
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  Widget buildLogin() {
    return ReactiveForm(
      formGroup: controller.form.control('login') as FormGroup,
      child: Column(
        children: [
          AuthTextField(
            prefixIcon: Icons.mail_outline,
            hint: 'E-Posta Adresiniz',
            formControlName: 'email',
          ),
          const SizedBox(height: 10),
          AuthTextField(
            prefixIcon: Icons.lock_outline_rounded,
            hint: 'Şifre',
            obscureText: true,
            showSuffixIcon: true,
            formControlName: 'password',
          ),
          _buildRememberMe(),
          const SizedBox(height: 15),
          BpButton(
            'GİRİŞ YAP',
            onTap: () async {
              // await controller.login();
              bool isRememberMe =
                  controller.form.control('login.rememberMe').value ?? false;
              if (isRememberMe) {
                // await Get.find<StorageService>()
                //     .saveMail(controller.form.control('login.email').value);
              }
            },
          ),
          /*const SizedBox(height: 10),
          PyButton(
            "Çıkış Yap",
            onTap: () async {
              ApiService.to.logout();
            },
          ),*/
        ],
      ),
    );
  }

  Row _buildRememberMe() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: AuthReactiveCheckbox(
              formControlName: 'rememberMe',
              text: 'Beni Hatırla',
              highlightedIndexes: [0, 1],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              overlayColor: Colors.transparent,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.centerRight,
            ),
            onPressed: () {
              Get.to(const EnterMailView());
            },
            child: const Text(
              'Şifremi unuttum?',
              style: TextStyle(
                fontSize: 14,
                color: ColorConstants.primaryNormal,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      );
}
