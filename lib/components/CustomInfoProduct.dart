import 'package:flutter/material.dart';

List<Widget> indexItems(List<dynamic> items) {
  List<Widget> itemsWidget = [];

  for (int i = 0; i < items.length; i++) {
    itemsWidget.add(Container(
      padding: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Material(
              color: Colors.white,
              child: Image.network(
                'https://assets.instabuy.com.br/ib.item.image.small/s-${items[i]['images'][0]}',
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  '${items[i]['name']}',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text('R\$' +
                    '${items[i]['prices'][0]['price'].toStringAsFixed(2)}'),
              )
            ],
          ),
        ],
      ),
    ));
  }
  return itemsWidget;
}
