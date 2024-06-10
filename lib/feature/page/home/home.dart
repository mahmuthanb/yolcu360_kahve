import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:route_map/route_map.dart';
import 'package:yolcu360_kahve/core/base/base_widget.dart';
import 'package:yolcu360_kahve/core/res/colors.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import 'package:yolcu360_kahve/core/res/l10n/l10n.dart';
import 'package:yolcu360_kahve/core/util/image_network.dart';
import 'package:yolcu360_kahve/feature/page/home/home_vm.dart';
import 'package:yolcu360_kahve/feature/page/home/search/search_delegate.dart';
import 'package:yolcu360_kahve/feature/page/home/widgets/cofee_type_button.dart';
import 'package:yolcu360_kahve/feature/page/home/widgets/coffee_card.dart';
import 'package:yolcu360_kahve/feature/page/home/widgets/coffee_placeholders.dart';
import 'package:yolcu360_kahve/feature/page/home/widgets/slider_text.dart';
import 'package:yolcu360_kahve/feature/router/app_router.routes.dart';

@RouteMap(name: "home")
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomeViewModel, HomePage> {
  @override
  void initState() {
    viewModel.getCoffeList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.initStatusBarColor();
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.l),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.35, 0.35],
              colors: [AppColors.black, AppColors.grey],
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.lblHomeLocation,
                          style: TextStyle(color: AppColors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              viewModel.userLocation,
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
                      child: ImageNetwork(imageUrl: viewModel.userPhotoUrl),
                    )
                  ],
                ),
              ),
              //Searchbar Section
              Container(
                margin: const EdgeInsets.only(bottom: AppDimens.l),
                padding: EdgeInsets.symmetric(
                    vertical: AppDimens.s, horizontal: AppDimens.s),
                decoration: BoxDecoration(
                  color: AppColors.darkGrey.darken(.3),
                  borderRadius: BorderRadius.circular(AppDimens.m),
                ),
                child: InkWell(
                  onTap: () => showSearch(
                    context: context,
                    useRootNavigator: true,
                    delegate: CustomSearchDelegate(data: viewModel.coffeeList),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => SearchRoute().push(context),
                        icon: Icon(Icons.search,
                            size: 30, color: AppColors.white),
                      ),
                      Expanded(
                        child: Text(
                          context.l10n.lblHomeSearchBox,
                          style: TextStyle(
                              color: AppColors.semiGrey.darken(.3),
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.primarySwatch,
                            borderRadius: BorderRadius.circular(AppDimens.s)),
                        margin: EdgeInsets.all(AppDimens.xs),
                        padding: EdgeInsets.all(AppDimens.s),
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.tune,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Slider Section
              Container(
                margin: const EdgeInsets.only(bottom: AppDimens.l),
                height: size.height * .225,
                width: size.width,
                child: Stack(
                  children: [
                    ImageNetwork(imageUrl: viewModel.sliderPhotoUrl),
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
                    itemBuilder: (context, index) {
                      bool isSelected = index == viewModel.actCofCat;
                      String data = viewModel.coffeeTypes[index];
                      return CoffeeTypeButton(
                        data,
                        () => viewModel.activeCoffeCat(index),
                        isSelected: isSelected,
                      );
                    },
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
