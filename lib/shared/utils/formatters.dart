// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/services.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final bool isCurrency;
  static const separator = '.'; // Change this to ',' for other locales
  static const decimalPoint = ','; // Change this to '.' for other locales

  ThousandsSeparatorInputFormatter(
    this.isCurrency,
  );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    if (newValue.text.endsWith(separator) &&
        newValue.text.contains(decimalPoint)) {
      return oldValue;
    }

    if (newValue.text.indexOf(decimalPoint) !=
        newValue.text.lastIndexOf(decimalPoint)) {
      return oldValue;
    }

    String newValueText = newValue.text.endsWith(separator)
        ? newValue.text.substring(0, newValue.text.length - 1) + decimalPoint
        : newValue.text;

    // Handle "deletion" of separator character
    String oldValueText =
        oldValue.text.replaceAll(separator, '').replaceAll(' ₺', '');
    newValueText = newValueText.replaceAll(separator, '').replaceAll(' ₺', '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      int startingPosition = newValueText.contains(decimalPoint)
          ? newValueText.lastIndexOf(decimalPoint) - 1
          : chars.length - 1;

      for (int i = startingPosition; i >= 0; i--) {
        if ((startingPosition - i) % 3 == 0 && i != startingPosition) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }
      if (newValueText.contains(decimalPoint)) {
        newString = newString +
            newValueText.substring(startingPosition + 1,
                min(startingPosition + 4, newValueText.length));
      }

      return TextEditingValue(
        text: isCurrency ? "$newString ₺" : newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}

class PhoneLastThreeDigitsInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.length == 1) {
      return newValue;
    }

    if (newValue.text.length == 2) {
      return newValue.copyWith(
          text: '${newValue.text[0]} ${newValue.text[1]}',
          selection: const TextSelection.collapsed(offset: 3));
    }

    if (newValue.text.length > 3) {
      return oldValue;
    }

    return newValue.copyWith(
        text: '${newValue.text[0]} ${newValue.text.substring(1)}',
        selection: const TextSelection.collapsed(offset: 4));
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (oldValue.text.isEmpty) {
      if (newValue.text == '0') {
        return oldValue;
      }
    }
    return newValue;
  }
}

class TurkishPhoneNumber {
  static String formatter(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) return "";
    if (phoneNumber.length != 13 || !phoneNumber.startsWith("+90")) {
      // Telefon numarası uygun formatta değilse, orijinal numarayı döndür.
      return phoneNumber;
    }

    final formattedNumber =
        '+90 (${phoneNumber.substring(3, 6)}) ${phoneNumber.substring(6, 9)} ${phoneNumber.substring(9, 11)} ${phoneNumber.substring(11)}';
    return formattedNumber;
  }
}

class TimestampFormatter {
  static String formatTimestamp(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedTime =
        "${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";
    return formattedTime;
  }
}
