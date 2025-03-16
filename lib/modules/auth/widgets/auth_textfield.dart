import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthTextField extends StatelessWidget {
  final String formControlName;
  final String hint;
  final bool? showSuffixIcon;
  final IconData? prefixIcon; // Sol tarafa ikon eklemek için yeni bir parametre
  final Map<String, String Function(Object)>? validationMessages;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Image? suffixIcon;

  AuthTextField({
    super.key,
    this.keyboardType,
    required this.formControlName,
    required this.hint,
    this.validationMessages,
    this.obscureText = false,
    this.showSuffixIcon = false,
    this.prefixIcon, // İkon parametresini initialize ediyoruz
    this.suffixIcon,
  });

  final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _obscureTextNotifier,
        builder: (context, isObscured, child) {
          return ReactiveTextField(
            formControlName: formControlName,
            keyboardType: keyboardType,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              filled: true, // Arka plan rengini aktif eder
              fillColor: ColorConstants.tfBgColor, // Arka plan rengini ayarlar
              prefixIcon: prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      color: Colors.black54, // İkonun rengi
                      size: 20, // İkonun boyutu
                    )
                  : null, // Eğer prefixIcon verilmediyse null bırakılır
              suffixIcon: (showSuffixIcon == true && obscureText == true)
                  ? GestureDetector(
                      onTap: () {
                        _obscureTextNotifier.value = !isObscured;
                      },
                      child: Icon(
                        isObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                        color: Colors.black54,
                        size: 20,
                      ),
                    )
                  : suffixIcon,
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black26,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: ColorConstants.redNormal),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: ColorConstants.redNormal),
              ),
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorConstants.tfHintColor, letterSpacing: 0.5),
            ),
            obscureText: obscureText == true ? isObscured : false,
          );
        });
  }
}
