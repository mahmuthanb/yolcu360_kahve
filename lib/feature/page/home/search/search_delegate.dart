import 'package:flutter/material.dart';
import 'package:yolcu360_kahve/feature/data/model/coffee_model.dart';
import 'package:yolcu360_kahve/feature/page/home/widgets/coffee_card_horizontal.dart';

class CustomSearchDelegate extends SearchDelegate<CoffeeModel> {
  final List<CoffeeModel> data;
  CustomSearchDelegate({required this.data});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<CoffeeModel> searchResults = data
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].title),
          onTap: () {
            // Handle the selected search result.
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<CoffeeModel> suggestionList = query.isEmpty
        ? []
        : data
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.separated(
      itemCount: suggestionList.length,
      separatorBuilder: (context, index) => Divider(height: 2, thickness: 2),
      itemBuilder: (context, index) =>
          CoffeCardHorizontal(suggestionList[index]),
    );
  }
}
