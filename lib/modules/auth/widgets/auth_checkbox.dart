import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthReactiveCheckbox extends StatelessWidget {
  final String formControlName;
  final String text;
  final List<int>? highlightedIndexes;
  final Function(bool)? onChanged;

  const AuthReactiveCheckbox({
    super.key,
    required this.formControlName,
    required this.text,
    this.highlightedIndexes,
    this.onChanged,
  });

  TextSpan buildHighlightedTextSpan(
      String text, List<int> highlightedIndexes, BuildContext context) {
    final words = text.split(' ');
    List<TextSpan> spans = [];

    for (int i = 0; i < words.length; i++) {
      final word = words[i];
      final textStyle = highlightedIndexes.contains(i)
          ? Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorConstants.kTextColor,
              fontSize: 14.0,
              fontWeight: FontWeight.normal)
          : Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 14.0,
                color: ColorConstants.tfHintColor,
              );

      spans.add(TextSpan(text: '$word ', style: textStyle));
    }

    return TextSpan(children: spans);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.0,
          width: 19.0,
          child: ReactiveCheckbox(
            formControlName: formControlName,
            onChanged: (control) {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            activeColor: ColorConstants.primaryNormal,
            side: const BorderSide(
              width: 1,
              color: ColorConstants.primaryNormal,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: RichText(
            text: buildHighlightedTextSpan(
                text, highlightedIndexes ?? [], context),
          ),
        ),
      ],
    );
  }
}
