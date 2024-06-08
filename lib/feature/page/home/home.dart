import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:yolcu360_kahve/core/base/base_widget.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/util/alert_message.dart';
import 'package:yolcu360_kahve/core/util/image_network.dart';
import 'package:yolcu360_kahve/feature/page/home/home_vm.dart';
import 'package:yolcu360_kahve/feature/page/home/widgets/coffee_card.dart';
import 'package:yolcu360_kahve/feature/page/home/widgets/coffee_placeholders.dart';
import 'package:yolcu360_kahve/feature/page/home/widgets/slider_text.dart';

@RouteMap(name: "home")
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomeViewModel, HomePage> {
  @override
  void initState() {
    viewModel.initStatusBarColor();
    viewModel.getCoffeList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.l),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.25, 0.25],
              colors: [AppColors.black, AppColors.white],
            ),
          ),
          child: Column(
            children: [
              //Header Section
              Container(
                margin: const EdgeInsets.symmetric(vertical: AppDimens.l),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(color: AppColors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              "Bilzen,Tanjungbalai",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 30,
                              color: AppColors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimens.m),
                      ),
                      child: const ImageNetwork(
                          imageUrl: "https://picsum.photos/200"),
                    )
                  ],
                ),
              ),
              //Slider Section
              Container(
                margin: const EdgeInsets.only(bottom: AppDimens.l),
                height: size.height * .225,
                width: size.width,
                child: Stack(
                  children: [
                    const ImageNetwork(imageUrl: "https://picsum.photos/200"),
                    Container(
                      padding: const EdgeInsets.all(AppDimens.l),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SliderSmallText("Promo"),
                          Spacer(),
                          SliderMainText("Buy one get "),
                          SliderMainText("one free ")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //Coffe Types List Section
              Container(
                width: size.width,
                height: size.height * .05,
                margin: const EdgeInsets.only(bottom: AppDimens.l / 2),
                child: OverflowBox(
                  maxWidth: size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.l,
                      vertical: AppDimens.xs,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: AppDimens.s),
                    itemCount: viewModel.coffeeTypes.length,
                    itemBuilder: (context, index) => Wrap(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppDimens.s),
                          decoration: BoxDecoration(
                              color: AppColors.primarySwatch,
                              borderRadius: BorderRadius.circular(AppDimens.s)),
                          child: Text(
                            viewModel.coffeeTypes[index],
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Coffee List Section
              Expanded(
                child: viewModel.isLoading
                    ? CoffeeListPlaceholder(viewModel.sliverGridDelegate)
                    : viewModel.coffeeList.isNotEmpty
                        ? GridView.builder(
                            gridDelegate: viewModel.sliverGridDelegate,
                            padding: const EdgeInsets.only(
                              top: AppDimens.l / 2,
                              bottom: AppDimens.l,
                            ),
                            itemCount: viewModel.coffeeList.length,
                            itemBuilder: (context, index) =>
                                CoffeCard(viewModel.coffeeList[index]),
                          )
                        : const Center(child: Text("Veri Bulunamadi")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
