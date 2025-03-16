import 'package:flutter/material.dart';

class ColorConstants {
  static const Color primaryNormal = Color(0xFF314CCA);
  static const Color primaryNormalHover = Color(0xFF4B7EDD);
  static const Color primaryLight = Color(0xFFEEF4FE);
  static const Color primaryLightHover = Color(0xFFE5EEFE);
  static const Color primaryLightActive = Color(0xFFCADBFC);
  static const Color primaryDarker = Color(0xFF1D3156);

  static const Color blackNormal = Color(0xFF22272B);
  static const Color blackLight = Color(0xFFE9E9EA);
  static const Color blackLightHover = Color(0xffdedfdf);
  static const Color blackLightActive = Color(0xFF82888D);

  static const Color white = Colors.white;
  static const Color whiteHover = Color(0xFFE2E2E2);
  static const Color whiteActive = Color(0xFFF5F7F9);
  static const Color whiteDark = Color(0xFFF6F8F9);

  static const Color redNormal = Color(0xFFED3B18);
  static const Color redNormalHover = Color(0xFFD53516);
  static const Color redLight = Color(0xFFFDEBE8);
  static const Color redLightActive = Color(0xFFF9C2B7);
  static const Color redLightHover = Color(0xFFFCE2DC);

  static const Color greenNormal = Color(0xFF30B602);
  static const Color greenNormalHover = Color(0xFF2BA402);
  static const Color greenLight = Color(0xFFEAF8E6);
  static const Color greenLightActive = Color(0xFFBFE8B1);
  static const Color greenLightHover = Color(0xFFE0F4D9);

  static Color lightScaffoldBackgroundColor = hexToColor('#FFFFFF');
  static Color secondaryScaffoldBackgroundColor = const Color(0xffF8F8F8);
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#22DDA6');
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = const Color(0xFFF5F6FA);
  static Color darkGray = const Color(0xFFADA5B0);
  static Color black = const Color(0xFF000000);
  static Color kButtonColor = const Color(0xFF8FCA4F);
  static Color kPassiveButtonColor = Colors.grey.shade300;
  static Color tfHintColor = const Color(0xFF8C8C96);
  static Color tfBgColor = const Color(0xFFF9FAFB);
  static Color kTextColor = const Color.fromARGB(255, 0, 0, 0);
  static Color kDarkMainColor = const Color(0x66878ad6);
  static Color kNonFocusColor = const Color(0xff948799);
  static Color electronicColor = const Color(0xff36C1FF);
  static Color buildingColor = const Color(0xffFF9E00);
  static Color pharmacyColor = const Color(0xff00BB00);
  static Color sparePartsColor = const Color(0xffAB1E40);
  static Color orderColor = const Color(0xffFF9F36);
  static Color orderPriceColor = const Color(0xffFF7400);

  static Color kMainColor = const Color(0xFF324ECF);
  static Color kGreen = const Color(0xFF26A27C);
  static Color kPink = const Color(0xFFC427D1);
  static Color kOrange = const Color(0xFFF3BA2F);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
