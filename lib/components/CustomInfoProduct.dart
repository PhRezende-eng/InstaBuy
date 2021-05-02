import 'package:App/components/CustomItemCard.dart';
import 'package:flutter/material.dart';

class CustomInfoProductList extends StatelessWidget {
  final List<dynamic> items;
  CustomInfoProductList({this.items});

  List<Widget> indexItems() {
    List<Widget> itemsWidget = [];

    for (int i = 0; i < items.length; i++) {
      itemsWidget.add(
        CustomItemCard(
          items: items,
          index: i,
        ),
      );
    }
    return itemsWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: indexItems(),
    );
  }
}
