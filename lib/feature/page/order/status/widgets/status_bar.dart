import 'package:flutter/material.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';

// class StatusBar extends StatelessWidget {
//   const StatusBar(
//     this.activeCount, {
//     super.key,
//   });
//   final int activeCount;
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemBuilder: (c, i) => const StatusBarWidget(isActive: false));
//   }
// }

class StatusBarWidget extends StatelessWidget {
  const StatusBarWidget({
    super.key,
    required this.index,
    required this.activeIndex,
  });

  // final bool isActive;
  final int index;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: (index <= activeIndex) ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(
            AppDimens.s,
          ),
        ),
      ),
    );
  }
}
