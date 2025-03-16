import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum BpToastType { success, error, info }

class BpToast {
  static Future showInfoToast(String title, {String? message}) {
    return _showToast(BpToastType.info, title, message);
  }

  static Future showErrorToast(String title, {String? message}) {
    return _showToast(BpToastType.error, title, message);
  }

  static Future showSuccessToast(String title, {String? message}) {
    return _showToast(BpToastType.success, title, message);
  }

  static Future _showToast(
      BpToastType toastType, String title, String? message) {
    final mainColor = toastType == BpToastType.info
        ? ColorConstants.primaryNormal
        : toastType == BpToastType.error
            ? ColorConstants.redNormal
            : ColorConstants.greenNormal;
    final backgroundColor = toastType == BpToastType.info
        ? ColorConstants.primaryLight
        : toastType == BpToastType.error
            ? ColorConstants.redLight
            : ColorConstants.greenLight;
    final borderColor = toastType == BpToastType.info
        ? ColorConstants.primaryLightActive
        : toastType == BpToastType.error
            ? ColorConstants.redLightActive
            : ColorConstants.greenLightActive;
    final icon = toastType == BpToastType.info
        ? 'assets/icons/ic_info_circle.svg'
        : toastType == BpToastType.error
            ? 'assets/icons/ic_error_toast.svg'
            : 'assets/icons/ic_check_circle.svg';

    final controller = Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      borderRadius: 12,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      messageText: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BpText.baseSemibold(
                  title,
                  color: mainColor,
                ),
                if (message != null && message.isNotEmpty)
                  BpText.sm(message)
              ],
            ),
          ),
        ],
      ),
      shouldIconPulse: false,
    );

    return controller.future;
  }
}
