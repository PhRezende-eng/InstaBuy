import 'dart:ui';

import 'package:App/API.dart';
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

  // int name(itemsWidget) {
  //   if (itemsWidget) {}
  // }

  List<Widget> indexItems(List<dynamic> items) {
    List<Widget> itemsWidget = [];
    for (int i = 0; i < items.length; i++) {
      itemsWidget.add(Container(
        alignment: Alignment.center,
        width: 150,
        child: Column(
          children: [
            Image.network(
              'https://assets.instabuy.com.br/ib.item.image.small/s-${items[i]['images'][0]}',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${items[i]['name']}',
                  textAlign: TextAlign.center,
                ),
                Text('${items[i]['prices'][0]['price']}')
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Project for InstaBuy'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  child: Text('Banners'),
                  color: Colors.red[300],
                  onPressed: () {
                    Navigator.pushNamed(context, '/first');
                  },
                ),
                MaterialButton(
                  child: Text('Produtos'),
                  color: Colors.red[300],
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 47),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: isLoad
                  ? Container(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(2.0),
                      itemCount: collectionItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            padding: EdgeInsets.only(bottom: 0),
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: indexItems(
                                collectionItems[index]['items'],
                              ),
                            ));
                      },
                    ))
        ],
      ),
    );
  }
}
