import 'package:flutter/material.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/res/l10n/l10n.dart';
import 'package:yolcu360_kahve/core/util/formatter.dart';
import 'package:yolcu360_kahve/core/util/image_network.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/router/app_router.routes.dart';

class CoffeCard extends StatelessWidget {
  const CoffeCard(
    this.data, {
    super.key,
  });

  final CoffeeModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          ProductDetailRoute(data: data).push(context, rootNavigator: true),
      child: Card(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ImageNetwork(imageUrl: data.image),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 20,
                        height: 1.25,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (data.ingredients.isNotEmpty)
                      Text(
                        context.l10n.lblProductIngredients(
                          data.ingredients.convertListtoString(),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.25,
                        ),
                      ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.price.currencyFormat(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.add_box_rounded,
                            color: AppColors.primarySwatch,
                            size: 35,
                          ),
                        ),
                        // const SquareButton()
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
