// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yolcu360_kahve/core/res/dimens.dart';

class StatusBarWidget extends StatelessWidget {
  const StatusBarWidget({
    super.key,
    required this.index,
    required this.activeIndex,
  });

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
