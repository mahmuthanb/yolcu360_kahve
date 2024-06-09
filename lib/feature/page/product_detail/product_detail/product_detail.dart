import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yolcu360_kahve/core/res/assets.gen.dart';
import 'package:yolcu360_kahve/core/res/colors.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/res/theme.dart';
import 'package:yolcu360_kahve/core/util/formatter.dart';
import 'package:yolcu360_kahve/core/util/image_network.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:route_map/route_map.dart';
import 'package:yolcu360_kahve/feature/router/app_router.routes.dart';
import '/core/base/base_widget.dart';
import './product_detail_vm.dart';

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
        title: Text('Detail of ${widget.data.title}'),
        actions: [
          IconButton(
            onPressed: () => viewModel.addToFavorites(widget.data.id),
            icon: viewModel.isFavorited
                ? Icon(Icons.favorite)
                : Icon(
                    Icons.favorite_border,
                  ),
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
                          'with ${widget.data.ingredients.join(', ')}',
                          style: const TextStyle(
                            height: 1.25,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: 20),
                          text: "4.8",
                          children: [
                            TextSpan(text: ' '),
                            TextSpan(
                              text: '(230)',
                              style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.linked_camera),
                  //   highlightColor: AppColors.darkGrey,
                  // ),
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
              "Description",
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
                      text: viewModel.flag ? "Read More" : "Read Less",
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
            Text("Size", style: AppTheme.titleTextStyle),
            SizedBox(height: AppDimens.l),
            // Size Widgets Section
            Container(
              height: size.height * .05,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizeWidget("S", false),
                  SizeWidget("M", true),
                  SizeWidget("L", false),
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
                      "Price",
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
                    child: Text("BUY NOW"),
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

class SizeWidget extends StatelessWidget {
  const SizeWidget(
    this.text,
    this.isActive, {
    super.key,
  });
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Expanded(
      child: Container(
        height: size.height * .05,
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
        child: Center(
          child: Text(
            text,
            style: AppTheme.titleTextStyle.copyWith(
                color: isActive ? AppColors.primarySwatch : AppColors.darkGrey),
          ),
        ),
      ),
    );
  }
}
