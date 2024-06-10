import 'package:flutter/material.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';

class CoffeeTypeButton extends StatelessWidget {
  const CoffeeTypeButton(
    this.data,
    this.onPressed, {
    super.key,
    this.isSelected = false,
  });

  final String data;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(AppDimens.s),
            decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.primarySwatch : AppColors.semiGrey,
                borderRadius: BorderRadius.circular(AppDimens.s)),
            child: Text(
              data,
              style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.darkGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
