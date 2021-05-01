import 'dart:ui';
import 'package:App/service/api.dart';
import 'package:App/style.dart';
import 'package:flutter/material.dart';

class ProdutosPage extends StatefulWidget {
  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  List<dynamic> collectionItems;

  bool isLoad = true;

  void getData() async {
    var response = await fetch();

    setState(() {
      collectionItems = response['data']['collection_items'];
      isLoad = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Image.network(
                'https://assets.instabuy.com.br/ib.item.image.small/s-${items[i]['images'][0]}',
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

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              backGroundApp,
            ],
          ),
        ),
        child: isLoad
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: collectionItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            collectionItems[index]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 0),
                          width: MediaQuery.of(context).size.width,
                          height: 330,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                children: indexItems(
                                  collectionItems[index]['items'],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ));
  }
}
