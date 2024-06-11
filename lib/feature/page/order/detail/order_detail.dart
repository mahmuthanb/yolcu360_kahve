// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:route_map/route_map.dart';

// Project imports:
import 'package:yolcu360_kahve/core/base/base_widget.dart';
import 'package:yolcu360_kahve/core/res/assets.gen.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/res/l10n/l10n.dart';
import 'package:yolcu360_kahve/core/res/theme.dart';
import 'package:yolcu360_kahve/core/util/formatter.dart';
import 'package:yolcu360_kahve/core/util/image_network.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/page/order/detail/order_detail_vm.dart';
import 'package:yolcu360_kahve/feature/router/app_router.routes.dart';

@RouteMap()
class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage(this.data, {super.key});
  final CoffeeModel data;
  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState
    extends BaseState<OrderDetailViewModel, OrderDetailPage> {
  @override
  void initState() {
    viewModel.coffeeData = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.ttlOrderPage),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.l),
        child: Column(
          children: [
            // Delivery Section
            Container(
              width: size.width,
              height: size.height * .05,
              margin: const EdgeInsets.only(bottom: AppDimens.l),
              padding: const EdgeInsets.all(AppDimens.xs),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.m - 2),
                color: AppColors.semiGrey,
              ),
              child: ToggleButtons(
                constraints:
                    BoxConstraints.expand(width: (size.width - 56) / 2),
                color: AppColors.darkGrey,
                selectedColor: AppColors.white,
                fillColor: AppColors.primarySwatch,
                borderWidth: 0,
                borderRadius: BorderRadius.circular(AppDimens.s),
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < viewModel.isSelected.length; i++) {
                      viewModel.isSelected[i] = i == index;
                    }
                  });
                },
                isSelected: viewModel.isSelected,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Deliver',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const Text('Pick Up', style: TextStyle(fontSize: 16))
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.lblOrderDeliveryAdress,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: AppDimens.m),
                const Text(
                  "JI. Kpg Sutoyo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: AppDimens.m),
                const Text(
                  "Kpg. Sutoyo No:620 Bilzen,Tanjungbalai",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: AppDimens.m),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Text(
                        context.l10n.lblOrderEditAddress,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      icon: SvgPicture.asset(AppAssets.images.editAddress,
                          width: 15),
                      style: ButtonStyle(
                        elevation: WidgetStateProperty.all(0),
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.white),
                      ),
                    ),
                    const SizedBox(width: AppDimens.m),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Text(
                        context.l10n.lblOrderAddNote,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      icon:
                          SvgPicture.asset(AppAssets.images.addnote, width: 15),
                      style: ButtonStyle(
                        elevation: WidgetStateProperty.all(0),
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AppTheme.customDivider,
            // Products Section
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SizedBox(
                    height: size.height * .075,
                    child: ImageNetwork(imageUrl: viewModel.coffee.image),
                  ),
                ),
                const SizedBox(width: AppDimens.m),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(viewModel.coffee.title),
                      if (viewModel.coffee.ingredients.isNotEmpty)
                        Text(
                          context.l10n.lblProductIngredients(viewModel
                              .coffee.ingredients
                              .convertListtoString()),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: 1.25,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.semiGrey),
                  ),
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 15,
                    child: IconButton(
                      onPressed: viewModel.orderCount != 1
                          ? () => viewModel.setOrderCount = false
                          : null,
                      icon: const Icon(Icons.remove),
                      padding: EdgeInsets.zero,
                      iconSize: 20,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimens.m),
                  child: Text(
                    viewModel.orderCount.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.semiGrey),
                  ),
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 15,
                    child: IconButton(
                      onPressed: () => viewModel.setOrderCount = true,
                      icon: const Icon(Icons.add),
                      padding: EdgeInsets.zero,
                      iconSize: 20,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            AppTheme.customDivider,
            // Payment Summart && Discount Section
            Container(
              padding: const EdgeInsets.all(AppDimens.m),
              margin: const EdgeInsets.only(bottom: AppDimens.l),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppDimens.m),
                border: Border.all(color: AppColors.semiGrey, width: 2),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.images.percentage,
                    width: 25,
                  ),
                  const SizedBox(width: AppDimens.m),
                  Text(
                    context.l10n.lblOrderPaymentDiscount(1),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.lblOrderPaymentSummary,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: AppDimens.s),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.lblPrice,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      viewModel.coffee.price.currencyFormat(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimens.s),
                Row(
                  children: [
                    Text(
                      context.l10n.lblOrderPaymentDeliveryFee,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      2.currencyFormat(),
                      style: const TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: AppDimens.s),
                    Text(
                      1.currencyFormat(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Divider
            AppTheme.customDivider,
            // Total Payment Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Payment",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  (5.53).currencyFormatDb(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(AppDimens.l),
        decoration: AppTheme.bottomSheetBoxDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: AppDimens.l),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.images.cash, width: 30),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: AppDimens.m),
                    padding: const EdgeInsets.all(AppDimens.s),
                    decoration: BoxDecoration(
                      color: AppColors.primarySwatch,
                      borderRadius: BorderRadius.circular(AppDimens.l),
                    ),
                    child: const Text(
                      "Cash",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                  Text(
                    (5.53).currencyFormatDb(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: IconButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.darkGrey),
                        iconSize: WidgetStateProperty.all(25),
                        iconColor: WidgetStateProperty.all(
                          AppColors.white,
                        ),
                      ),
                      icon: const Icon(Icons.more_horiz),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height * .06,
              child: ElevatedButton(
                onPressed: () => OrderStatusRoute().push(context),
                style: AppTheme.elevatedButtonStyle,
                child: const Text("Order", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
