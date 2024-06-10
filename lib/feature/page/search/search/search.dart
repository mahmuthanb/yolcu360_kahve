import 'package:flutter/material.dart';
import '/core/base/base_widget.dart';
import 'package:route_map/route_map.dart';
import './search_vm.dart';

@RouteMap()
class SearchPage extends StatefulWidget {
  
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}
class _SearchPageState extends BaseState<SearchViewModel,SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:const Text('SearchPage'),),);
  }
}