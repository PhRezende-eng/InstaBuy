import 'package:flutter/material.dart';

class CustomItemCard extends StatelessWidget {
  final List<dynamic> items;
  final int index;

  CustomItemCard({this.items, this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                'https://assets.instabuy.com.br/ib.item.image.small/s-${items[index]['images'][0]}',
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  '${items[index]['name']}',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text('R\$' +
                    '${items[index]['prices'][0]['price'].toStringAsFixed(2)}'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
