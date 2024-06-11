// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.m),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.white,
        ),
        child: const Center(
          child: Icon(
            Icons.add_box_rounded,
            color: AppColors.primarySwatch,
          ),
        ),
      ),
    );
  }
}
