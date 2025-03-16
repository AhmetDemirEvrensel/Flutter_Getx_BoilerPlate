import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/bp_text.dart';

class BpBottomSheetLayout extends StatelessWidget {
  final String title;
  final void Function()? onClose;
  final List<Widget> children;
  const BpBottomSheetLayout({
    super.key,
    required this.title,
    required this.children,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Get.theme.colorScheme.surface,
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 6,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    Center(child: BpText.lgBold(title)),
                    const Divider(),
                  ],
                ),
              ),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
