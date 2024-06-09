import 'package:flutter/material.dart';
import 'package:yolcu360_kahve/core/res/colors.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';
import '/core/base/base_widget.dart';
import 'package:route_map/route_map.dart';
import './order_detail_vm.dart';

@RouteMap()
class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});
  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState
    extends BaseState<OrderDetailViewModel, OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderDetailPage'),
      ),
      body: Column(children: [
        Container(
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.m),
            color: AppColors.darkGrey,
          ),
          child: Expanded(
            child: ToggleButtons(
              fillColor: AppColors.primarySwatch,
              selectedColor: AppColors.white,
              // borderWidth: 10,
              borderRadius: BorderRadius.circular(AppDimens.m),
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(9),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Deliver',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(9.0),
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Pick Up', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < viewModel.isSelected.length; i++) {
                    viewModel.isSelected[i] = i == index;
                  }
                });
              },
              isSelected: viewModel.isSelected,
            ),
          ),
        )
      ]),
    );
  }
}
