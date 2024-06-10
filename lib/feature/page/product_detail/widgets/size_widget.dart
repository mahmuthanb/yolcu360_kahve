import 'package:flutter/material.dart';
import 'package:yolcu360_kahve/core/res/colors.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/res/theme.dart';

class SizeWidget extends StatelessWidget {
  const SizeWidget(
    this.text,
    this.isActive,
    this.onPressed, {
    super.key,
  });
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primarySwatch.lighten(0.4)
              : AppColors.semiGrey,
          border: Border.all(
            color: isActive ? AppColors.primarySwatch : AppColors.darkGrey,
          ),
          borderRadius: BorderRadius.circular(
            AppDimens.m,
          ),
        ),
        margin: EdgeInsets.only(right: AppDimens.m),
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: AppTheme.titleTextStyle.copyWith(
                  color:
                      isActive ? AppColors.primarySwatch : AppColors.darkGrey),
            ),
          ),
        ),
      ),
    );
  }
}
