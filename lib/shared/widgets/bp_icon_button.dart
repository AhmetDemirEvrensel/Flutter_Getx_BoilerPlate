// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BpIconButton extends StatelessWidget {
  void Function()? onTap;
  Color? color;
  Color? hoverColor;
  Color? textColor;
  final String text;
  final String iconPath;
  final Color iconBackgroundColor;

  BpIconButton(
    this.text,
    this.iconPath, {
    super.key,
    this.onTap,
    this.color = ColorConstants.primaryNormal,
    this.hoverColor = ColorConstants.primaryNormalHover,
    this.textColor = ColorConstants.white,
    this.iconBackgroundColor = ColorConstants.white,
  });

  BpIconButton.tonal(
    this.text,
    this.iconPath, {
    super.key,
    this.onTap,
    this.color = ColorConstants.primaryLightHover,
    this.hoverColor = ColorConstants.primaryLightActive,
    this.textColor = ColorConstants.blackNormal,
    this.iconBackgroundColor = ColorConstants.primaryNormal,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(8),
        splashColor: hoverColor,
        highlightColor: hoverColor,
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  iconPath,
                  colorFilter: const ColorFilter.mode(
                      ColorConstants.white, BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: 8),
              BpText.smSemibold(
                text,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
