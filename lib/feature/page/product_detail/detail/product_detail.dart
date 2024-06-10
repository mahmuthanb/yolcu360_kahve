import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yolcu360_kahve/core/res/assets.gen.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/res/l10n/l10n.dart';
import 'package:yolcu360_kahve/core/res/theme.dart';
import 'package:yolcu360_kahve/core/util/formatter.dart';
import 'package:yolcu360_kahve/core/util/image_network.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:route_map/route_map.dart';
import 'package:yolcu360_kahve/feature/page/product_detail/widgets/size_widget.dart';
import 'package:yolcu360_kahve/feature/router/app_router.routes.dart';
import '/core/base/base_widget.dart';
import 'product_detail_vm.dart';

@RouteMap()
class ProductDetailPage extends StatefulWidget {
  final CoffeeModel data;
  const ProductDetailPage(this.data, {super.key});
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailViewModel, ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    viewModel.checkFavlist(widget.data.id);
    viewModel.checkTextLength(widget.data.description);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.ttlDetailPage),
        actions: [
          IconButton(
            onPressed: () => viewModel.addToFavorites(widget.data.id),
            icon: viewModel.isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimens.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * .225,
              width: size.width,
              child: ImageNetwork(imageUrl: widget.data.image),
            ),
            Container(
              padding: EdgeInsets.only(top: AppDimens.l),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.title,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: size.width * .6,
                        padding:
                            const EdgeInsets.symmetric(vertical: AppDimens.s),
                        child: Text(
                          context.l10n.lblProductIngredients(
                              widget.data.ingredients.convertListtoString()),
                          style: const TextStyle(
                            height: 1.25,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.images.star),
                          SizedBox(width: AppDimens.xs),
                          Text('4.8',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(width: AppDimens.xs),
                          Text('(230)', style: TextStyle(fontSize: 16))
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    AppAssets.images.coffeebean,
                    width: 50,
                  ),
                  SizedBox(width: AppDimens.s),
                  SvgPicture.asset(
                    AppAssets.images.milkbox,
                    width: 50,
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.semiGrey,
              thickness: 2,
              height: AppDimens.l * 2,
            ),
            Text(
              context.l10n.lblDetailDescription,
              style: AppTheme.titleTextStyle,
            ),
            SizedBox(height: AppDimens.l),
            if (viewModel.secondHalf.isEmpty)
              Text(
                widget.data.description,
                style: TextStyle(
                  color: AppColors.darkGrey,
                ),
              )
            else
              RichText(
                text: TextSpan(
                  style: TextStyle(color: AppColors.darkGrey, fontSize: 18),
                  children: [
                    TextSpan(text: viewModel.firstHalf),
                    if (viewModel.flag) TextSpan(text: ".. "),
                    if (!viewModel.flag) TextSpan(text: viewModel.secondHalf),
                    TextSpan(
                      text: viewModel.flag
                          ? context.l10n.lblReadMore
                          : context.l10n.lblReadLess,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => viewModel.setFlag = !viewModel.flag,
                      style: TextStyle(
                        color: AppColors.primarySwatch,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: AppDimens.l),
            // Size Title
            Text(context.l10n.lblDetailSize, style: AppTheme.titleTextStyle),
            SizedBox(height: AppDimens.l),
            // Size Widgets Section
            Container(
              height: size.height * .05,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizeWidget(
                    "S",
                    viewModel.sizeActive[0],
                    () => viewModel.changeSizeIndex(0),
                  ),
                  SizeWidget(
                    "M",
                    viewModel.sizeActive[1],
                    () => viewModel.changeSizeIndex(1),
                  ),
                  SizeWidget(
                    "L",
                    viewModel.sizeActive[2],
                    () => viewModel.changeSizeIndex(2),
                  ),
                ],
              ),
            ),
            Spacer(),
            Divider(
              color: AppColors.semiGrey,
              thickness: 2,
              height: AppDimens.l * 2,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(AppDimens.l),
        decoration: AppTheme.bottomSheetBoxDecoration,
        child: Container(
          height: size.height * .07,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.lblPrice,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    Text(
                      widget.data.price.currencyFormat(),
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.primarySwatch,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: size.height * .06,
                  child: ElevatedButton(
                    onPressed: () =>
                        OrderDetailRoute(data: widget.data).push(context),
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimens.m,
                          ),
                        ),
                      ),
                    ),
                    child: Text(
                      context.l10n.lblBuyNow,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
