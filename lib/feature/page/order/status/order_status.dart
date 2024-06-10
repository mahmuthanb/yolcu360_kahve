import 'package:flutter/material.dart';
import 'package:yolcu360_kahve/core/base/base_widget.dart';
import 'package:route_map/route_map.dart';
import 'package:yolcu360_kahve/feature/page/order/status/order_status_vm.dart';

@RouteMap()
class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({super.key});
  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState
    extends BaseState<OrderStatusViewModel, OrderStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderStatusPage'),
      ),
    );
  }
}
