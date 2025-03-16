// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/controller/auth_controller.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/auth_title.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_button.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_text.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  final AuthController controller = Get.find();
  Timer? _timer;
  Duration _remaining = const Duration(minutes: 3);
  String _code = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remaining = const Duration(minutes: 3);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_remaining.inSeconds > 0) {
          _remaining -= const Duration(seconds: 1);
        } else {
          _timer?.cancel();
          // Option to resend after timer expires
        }
      });
    });
  }

  void _sendEmailConfirmAgain() {
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
      title: 'Hesabı Doğrula',
      subtitle: 'E-Postanıza gönderdiğimiz 4 haneli doğrulama kodunu giriniz.',
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  buildVerificationCode(),
                  const SizedBox(
                    height: 50,
                  ),
                  buildTime(),
                  if (_remaining.inSeconds == 0)
                    TextButton(
                      onPressed: _sendEmailConfirmAgain,
                      child: const BpText.base(
                        "Tekrar kod gönder.",
                        color: ColorConstants.primaryNormal,
                      ),
                    ),
                  const Spacer(),
                  BpButton(
                    'Devam Et',
                    textColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildTime() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: RichText(
        text: TextSpan(
          text: "Kodu Tekrar Gönder: ", // Normal olan metin
          style: TextStyle(
            color: ColorConstants.kTextColor,
            fontWeight: FontWeight.normal, // Normal font ağırlığı
            fontSize: 14, // Yazı boyutu
          ),
          children: [
            TextSpan(
              text: _formatDuration(_remaining), // Kalın yapılacak süre kısmı
              style: const TextStyle(
                fontWeight: FontWeight.bold, // Kalın font ağırlığı
                fontSize: 14, // Aynı yazı boyutu
              ),
            ),
          ],
        ),
      ),
    );
  }

  VerificationCode buildVerificationCode() {
    return VerificationCode(
      fullBorder: true,
      underlineColor: Colors.black12,
      underlineUnfocusedColor: Colors.black12,
      length: 4,
      keyboardType: TextInputType.number,
      autofocus: true,
      textStyle: const TextStyle(
          color: ColorConstants.primaryNormal,
          fontWeight: FontWeight.bold,
          fontSize: 18),
      cursorColor: ColorConstants.primaryNormal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      onEditing: (value) {},
      onCompleted: (String value) {
        setState(() {
          _code = value;
        });
      },
    );
  }

  String _formatDuration(Duration duration) {
    return "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  Widget _buildSubmitButton(BuildContext context) {
    return BpButton(
      'Onayla',
      onTap: () async {
        if (_code.isNotEmpty) {}
      },
      textColor: Colors.white,
    );
  }
}
