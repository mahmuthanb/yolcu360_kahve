// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/util/image_network.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/router/app_router.routes.dart';

class CoffeCardHorizontal extends StatelessWidget {
  const CoffeCardHorizontal(
    this.data, {
    super.key,
  });

  final CoffeeModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          ProductDetailRoute(data: data).push(context, rootNavigator: true),
      child: Container(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.l,
          vertical: AppDimens.s,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 50,
                width: 50,
                child: ImageNetwork(imageUrl: data.image)),
            const SizedBox(width: AppDimens.m),
            Text(
              data.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 30,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
