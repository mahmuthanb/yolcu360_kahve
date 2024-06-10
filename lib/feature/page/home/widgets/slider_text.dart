import 'package:flutter/material.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';

class SliderMainText extends StatelessWidget {
  const SliderMainText(this.text, {super.key});

  final String text;
  final size = 45.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size - 6.0,
      margin: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
        color: AppColors.black,
      ),
      child: Transform.translate(
        offset: const Offset(0.0, -25.0),
        child: Text(
          text,
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class SliderSmallText extends StatelessWidget {
  const SliderSmallText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.s),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(AppDimens.s),
      ),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.grey),
      ),
    );
  }
}
