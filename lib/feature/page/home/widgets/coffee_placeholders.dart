import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yolcu360_kahve/core/res/colors.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';

class CoffeeListPlaceholder extends StatelessWidget {
  const CoffeeListPlaceholder(this.gridDelegate, {super.key});
  final SliverGridDelegate gridDelegate;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: gridDelegate,
      padding: const EdgeInsets.only(
        top: AppDimens.l / 2,
        bottom: AppDimens.l,
      ),
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const CoffeeCardPlaceHolder(),
    );
  }
}

class CoffeeCardPlaceHolder extends StatelessWidget {
  const CoffeeCardPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.white,
      highlightColor: AppColors.primarySwatch.lighten(.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: AppColors.black,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppDimens.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: AppColors.black,
                    ),
                    child: const Text(
                      "placeholder text",
                      style: TextStyle(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: AppColors.black,
                    ),
                    margin: const EdgeInsets.only(top: AppDimens.xs),
                    child: const Text(
                      'some text',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 1.25,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: AppColors.black,
                        ),
                        child: const Text(
                          "price holder",
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: AppColors.black,
                        ),
                        width: 25,
                        height: 25,
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
    );
  }
}
