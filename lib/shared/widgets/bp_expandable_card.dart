import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';
import 'package:flutter_getx_boilerplate/shared/widgets/mounted_state.dart';

// class FaqScreen extends StatelessWidget {
//   final String title;
//   final List<FaqQuestion> items;
//   const FaqScreen({super.key, required this.title, required this.items});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PyAppBar(title),
//       body: SafeArea(
//         child: ListView.separated(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           itemBuilder: (context, index) {
//             return PyExpandableCard(
//               isExpanded: false,
//               collapsedChild: PyText.lgSemibold(items[index].header),
//               expandedChild: PyText.sm(
//                 items[index].body,
//                 color: ColorConstants.blackLightActive,
//               ),
//             );
//           },
//           separatorBuilder: (context, index) {
//             return const SizedBox(height: 12);
//           },
//           itemCount: items.length,
//         ),
//       ),
//     );
//   }
// }

class BpExpandableCard extends StatefulWidget {
  final bool isExpanded;
  final Widget collapsedChild;
  final Widget expandedChild;

  const BpExpandableCard(
      {super.key,
      required this.isExpanded,
      required this.collapsedChild,
      required this.expandedChild});

  @override
  State<BpExpandableCard> createState() => _BpExpandableCardState();
}

  class _BpExpandableCardState extends MountedState<BpExpandableCard> {
  late bool _isExpanded;
  @override
  void initState() {
    _isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 350),
      curve: Curves.fastOutSlowIn,
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorConstants.blackLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: widget.collapsedChild),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _isExpanded
                              ? ColorConstants.white
                              : ColorConstants.primaryNormal,
                          border: _isExpanded
                              ? Border.all(color: ColorConstants.primaryNormal)
                              : Border.all(color: ColorConstants.tfHintColor),
                        ),
                        child: Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: _isExpanded
                              ? ColorConstants.black
                              : ColorConstants.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _isExpanded ? Divider() : const SizedBox.shrink()
                ],
              ),
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: widget.expandedChild,
              ),
          ],
        ),
      ),
    );
  }
}
