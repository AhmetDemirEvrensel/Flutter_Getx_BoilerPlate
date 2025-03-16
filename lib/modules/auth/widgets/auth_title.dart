import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:get/get.dart';

class HeaderWithOptionalSubtitle extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool text;

  const HeaderWithOptionalSubtitle({
    super.key,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.text = true, // Varsayılan olarak metin gösterilir.
  });

  @override
  Widget build(BuildContext context) {
    return text
        ? SafeArea(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: ColorConstants.primaryNormal,
                          size: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 60.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                title ?? '',
                                style: titleStyle ??
                                    const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.white),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                subtitle ?? '',
                                style: subtitleStyle ??
                                    const TextStyle(
                                      fontSize: 14,
                                      color: ColorConstants.whiteHover,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
