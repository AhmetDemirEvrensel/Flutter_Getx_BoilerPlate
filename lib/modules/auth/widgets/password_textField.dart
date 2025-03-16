import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_text.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PasswordTextfield extends StatelessWidget {
  final String hint;
  final String formControlName;
  final bool passwordCheck;

  const PasswordTextfield({
    super.key,
    required this.hint,
    required this.formControlName,
    this.passwordCheck = true,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscureTextNotifier = ValueNotifier<bool>(true);

    return ReactiveFormField(
      formControlName: formControlName,
      builder: (field) {
        final hasError = field.control.invalid && field.control.touched;
        return ValueListenableBuilder<bool>(
          valueListenable: obscureTextNotifier,
          builder: (context, isObscured, child) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstants.tfBgColor,
                border: Border.all(
                  color: hasError ? Colors.red : Colors.black12,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ReactiveTextField(
                    formControlName: formControlName,
                    obscureText: isObscured,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          Colors.transparent, // Container'ın rengi kullanılıyor
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.black54,
                        size: 20,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          obscureTextNotifier.value = !isObscured;
                        },
                        child: Icon(
                          isObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          color: Colors.black54,
                          size: 20,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                hasError ? Colors.red : Colors.grey.shade300),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: hasError ? Colors.red : Colors.black12),
                      ),
                      hintText: hint,
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: ColorConstants.tfHintColor,
                                letterSpacing: 0.5,
                              ),
                      isDense: true,
                      contentPadding: const EdgeInsets.only(top: 10, left: 30),
                    ),
                  ),
                  const SizedBox(height: 10),
                  passwordCheck
                      ? Row(
                          children: [
                            buildCheckPassword(
                              'En az 8 karakter',
                              (_getFormGroup(context)
                                              ?.control(formControlName)
                                              .value
                                              ?.toString() ??
                                          '')
                                      .length >=
                                  8,
                            ),
                            const SizedBox(width: 5),
                            buildCheckPassword(
                              '1 Harf',
                              RegExp(r'[a-zA-Z]').hasMatch(
                                _getFormGroup(context)
                                        ?.control(formControlName)
                                        .value
                                        ?.toString() ??
                                    '',
                              ),
                            ),
                            const SizedBox(width: 5),
                            buildCheckPassword(
                              '1 Rakam',
                              RegExp(r'\d').hasMatch(
                                _getFormGroup(context)
                                        ?.control(formControlName)
                                        .value
                                        ?.toString() ??
                                    '',
                              ),
                            ),
                          ],
                        )
                      : buildCheckPassword(
                          'Şifreler Eşleşiyor',
                          _getFormGroup(context)
                                  ?.control('newPasswordRepeat')
                                  .value
                                  ?.toString() ==
                              _getFormGroup(context)
                                  ?.control('newPassword')
                                  .value
                                  ?.toString(),
                        ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }

  FormGroup? _getFormGroup(BuildContext context) {
    final form = ReactiveForm.of(context);
    if (form is FormGroup) {
      return form;
    }
    return null;
  }

  Row buildCheckPassword(String text, bool isConditionMet) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 35,
          decoration: BoxDecoration(
            color: isConditionMet ? Colors.green : Colors.transparent,
            border: Border.all(
              color: isConditionMet ? Colors.green : ColorConstants.tfHintColor,
              width: 1,
            ),
            shape: BoxShape.circle,
          ),
          child: isConditionMet
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                )
              : null,
        ),
        const SizedBox(width: 5),
        BpText.base(
          text,
          color: ColorConstants.tfHintColor,
        ),
      ],
    );
  }
}
