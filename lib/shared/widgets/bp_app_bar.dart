import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_text.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';

class BpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final bool? centerTitle;
  final Color? color;
  final bool? backIcon;
  final String? subtitleText;
  final Widget? titleWidget;
  final bool noLeading;
  final bool forceLeading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final CircleAvatar? leading;
  final Color contentColor;
  final void Function()? onBackTap;
  final Color? backgroundColor;
  final double? leadingWidth;
  final double? actionPadding;

  const BpAppBar(
    this.titleText, {
    super.key,
    this.titleWidget,
    this.noLeading = false,
    this.actions,
    this.bottom,
    this.leading,
    this.contentColor = ColorConstants.blackNormal,
    this.onBackTap,
    this.forceLeading = false,
    this.backgroundColor,
    this.actionPadding = 12,
    this.leadingWidth = 50,
    this.subtitleText,
    this.centerTitle = false,
    this.color,
    this.backIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isFirst = Get.rawRoute?.isFirst ?? true;
    return Material(
      elevation: 0.5,
      shadowColor: color ?? Colors.black,
      child: AppBar(
        automaticallyImplyLeading: backIcon ?? true,
        backgroundColor: backgroundColor,
        centerTitle: centerTitle ?? true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            titleWidget ??
                BpText(
                  titleText,
                  color: color ?? ColorConstants.kTextColor,
                ),
            if (subtitleText != null &&
                subtitleText!.isNotEmpty) // Eğer subtitle boş değilse göster
              BpText(
                subtitleText!,
                color: ColorConstants.tfHintColor,
              ),
          ],
        ),
        leadingWidth: leading != null
            ? leadingWidth
            : !forceLeading && (isFirst || noLeading)
                ? 0
                : 40,
        leading: leading != null
            ? Padding(
                padding: const EdgeInsets.only(left: 10),
                child: leading,
              )
            : (!forceLeading && (isFirst || noLeading)
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        tooltip: 'Geri',
                        color: ColorConstants.white,
                        onPressed: () {
                          if (onBackTap == null) {
                            Get.back();
                          } else {
                            onBackTap!();
                          }
                        },
                        icon:
                            const Icon(Icons.arrow_back_ios_rounded, size: 15),
                      ),
                    ),
                  )),
        actions: actions == null
            ? null
            : [
                ...actions!,
                SizedBox(width: actionPadding),
              ],
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => bottom == null
      ? const Size.fromHeight(kToolbarHeight)
      : const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
}
