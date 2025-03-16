// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_text.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/mounted_state.dart';

enum BpButtonType { filled, outlined }

class BpButton extends StatefulWidget {
  final BpButtonType? buttonType;
  final bool? disabled;
  final Future Function()? onTap;
  final Color? color;
  final Color? hoverColor;
  final Color? textColor;
  final double radius;
  final Border? border;
  final String text;

  BpButton(
    this.text, {
    super.key,
    this.buttonType = BpButtonType.filled,
    this.disabled = false,
    this.onTap,
    this.color = ColorConstants.primaryNormal,
    this.hoverColor = ColorConstants.primaryNormalHover,
    this.textColor = ColorConstants.white,
    this.radius = 12,
    this.border,
  });

  BpButton.outlined(
    this.text, {
    super.key,
    this.buttonType = BpButtonType.outlined,
    this.disabled = false,
    this.onTap,
    this.color = ColorConstants.white,
    this.hoverColor = ColorConstants.whiteActive,
    this.textColor = ColorConstants.primaryNormal,
    this.radius = 60,
    this.border,
  });

  BpButton.tonal(
    this.text, {
    super.key,
    this.buttonType = BpButtonType.filled,
    this.disabled = false,
    this.onTap,
    this.color = ColorConstants.primaryLightHover,
    this.hoverColor = ColorConstants.primaryLightHover,
    this.textColor = ColorConstants.primaryNormal,
    this.radius = 60,
    this.border,
  });

  BpButton.green(
    this.text, {
    super.key,
    this.buttonType = BpButtonType.filled,
    this.disabled = false,
    this.onTap,
    this.color = ColorConstants.greenNormal,
    this.hoverColor = ColorConstants.greenNormalHover,
    this.textColor = ColorConstants.white,
    this.radius = 60,
    this.border,
  });

  BpButton.red(
    this.text, {
    super.key,
    this.buttonType = BpButtonType.filled,
    this.disabled = false,
    this.onTap,
    this.color = ColorConstants.redNormal,
    this.hoverColor = ColorConstants.redNormalHover,
    this.textColor = ColorConstants.white,
    this.radius = 60,
    this.border,
  });

  BpButton.outlinedRed(
    this.text, {
    super.key,
    this.buttonType = BpButtonType.outlined,
    this.disabled = false,
    this.onTap,
    this.color = ColorConstants.white,
    this.hoverColor = ColorConstants.redLight,
    this.textColor = ColorConstants.redNormal,
    this.radius = 60,
    this.border,
  });

  BpButton.redTonal(
    this.text, {
    super.key,
    this.buttonType = BpButtonType.filled,
    this.disabled = false,
    this.onTap,
    this.color = ColorConstants.redLightHover,
    this.hoverColor = ColorConstants.redLightHover,
    this.textColor = ColorConstants.redNormal,
    this.radius = 60,
    this.border,
  });

  @override
  State<BpButton> createState() => _BpButtonState();
}

class _BpButtonState extends State<BpButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final isDisabled = _loading || (widget.disabled ?? false);
    final item = InkWell(
      onTap: isDisabled ? null : click,
      borderRadius: BorderRadius.circular(widget.radius),
      splashColor: widget.hoverColor,
      highlightColor: widget.hoverColor,
      child: Ink(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isDisabled ? ColorConstants.blackLight : widget.color,
          borderRadius: BorderRadius.circular(widget.radius),
          border: widget.border,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: isDisabled ? ColorConstants.blackLightActive : widget.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );

    if (widget.buttonType == BpButtonType.outlined && !isDisabled) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(color: widget.textColor!),
        ),
        child: Material(
          color: Colors.transparent,
          child: item,
        ),
      );
    }

    return Material(color: Colors.transparent, child: item);
  }

  Future<void> click() async {
    if (widget.onTap != null) {
      setState(() {
        _loading = true;
      });
      await widget.onTap!();
      setState(() {
        _loading = false;
      });
    }
  }
}
