import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';

enum BpTextStyle {
  lgBold,
  lgRegular,
  lgSemibold,
  smSemibold,
  smBold,
  smRegular,
  xsRegular,
  xsBold,
  h4Regular,
  h4Semibold,
  h4Bold,
  baseRegular,
  baseSemibold,
  baseBold,
  h3Semibold,
  h3Bold,
  h3Regular,
  h2Regular,
  h2Semibold,
  h2Bold,
  hLgSemibold,
  hLgBold,
  hLgRegular,
}

class BpText extends StatelessWidget {
  final BpTextStyle? textStyle;
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? decoration;
  const BpText(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.baseRegular,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.xs(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.xsRegular,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.xsBold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.xsBold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.sm(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.smRegular,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.smSemibold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.smSemibold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.smBold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.smBold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.base(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.baseRegular,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.baseSemibold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.baseSemibold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.baseBold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.baseBold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.lg(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.lgRegular,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.lgSemibold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.lgSemibold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.lgBold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.lgBold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.h2Bold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.h2Bold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.h2Semibold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.h2Semibold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.h3Semibold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.h3Semibold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.h3Bold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.h3Bold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.h3Regular(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.h3Regular,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.h4Semibold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.h4Semibold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.h4Bold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.h4Bold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.h4Regular(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.h4Regular,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.hLgSemibold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.hLgSemibold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  const BpText.hLgBold(
    this.text, {
    super.key,
    this.textStyle = BpTextStyle.hLgBold,
    this.color = ColorConstants.blackNormal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: _getFontSize(),
        height: _getLineHeight(),
        fontWeight: _getFontWeight(),
        decoration: decoration,
        decorationColor: color,
      ),
    );
  }

  double _getFontSize() {
    switch (textStyle) {
      case BpTextStyle.xsBold:
      case BpTextStyle.xsRegular:
        return 10;
      case BpTextStyle.smBold:
      case BpTextStyle.smRegular:
      case BpTextStyle.smSemibold:
        return 12;
      case BpTextStyle.baseBold:
      case BpTextStyle.baseRegular:
      case BpTextStyle.baseSemibold:
        return 14;
      case BpTextStyle.lgBold:
      case BpTextStyle.lgRegular:
      case BpTextStyle.lgSemibold:
        return 16;
      case BpTextStyle.h4Bold:
      case BpTextStyle.h4Regular:
      case BpTextStyle.h4Semibold:
        return 18;
      case BpTextStyle.h3Bold:
      case BpTextStyle.h3Regular:
      case BpTextStyle.h3Semibold:
        return 24;
      case BpTextStyle.h2Bold:
      case BpTextStyle.h2Regular:
      case BpTextStyle.h2Semibold:
        return 28;
      case BpTextStyle.hLgBold:
      case BpTextStyle.hLgRegular:
      case BpTextStyle.hLgSemibold:
        return 36;
      default:
        return 13;
    }
  }

  double _getLineHeight() {
    switch (textStyle) {
      case BpTextStyle.xsBold:
      case BpTextStyle.xsRegular:
        return 1.4;
      case BpTextStyle.smBold:
      case BpTextStyle.smRegular:
      case BpTextStyle.smSemibold:
        return 1.33333;
      case BpTextStyle.baseBold:
      case BpTextStyle.baseRegular:
      case BpTextStyle.baseSemibold:
        return 1.42857;
      case BpTextStyle.lgBold:
      case BpTextStyle.lgRegular:
      case BpTextStyle.lgSemibold:
        return 1.5;
      case BpTextStyle.h4Bold:
      case BpTextStyle.h4Regular:
      case BpTextStyle.h4Semibold:
        return 1.44444;
      case BpTextStyle.h3Bold:
      case BpTextStyle.h3Regular:
      case BpTextStyle.h3Semibold:
        return 1.33333;
      case BpTextStyle.h2Bold:
      case BpTextStyle.h2Regular:
      case BpTextStyle.h2Semibold:
        return 1.28571;
      case BpTextStyle.hLgBold:
      case BpTextStyle.hLgRegular:
      case BpTextStyle.hLgSemibold:
        return 1.33333;
      default:
        return 1;
    }
  }

  FontWeight _getFontWeight() {
    switch (textStyle) {
      case BpTextStyle.xsBold:
      case BpTextStyle.smBold:
      case BpTextStyle.baseBold:
      case BpTextStyle.lgBold:
      case BpTextStyle.h4Bold:
      case BpTextStyle.h3Bold:
      case BpTextStyle.h2Bold:
      case BpTextStyle.hLgBold:
        return FontWeight.bold;
      case BpTextStyle.smSemibold:
      case BpTextStyle.baseSemibold:
      case BpTextStyle.lgSemibold:
      case BpTextStyle.h4Semibold:
      case BpTextStyle.h3Semibold:
      case BpTextStyle.h2Semibold:
      case BpTextStyle.hLgSemibold:
        return FontWeight.w600;
      default:
        return FontWeight.normal;
    }
  }
}
