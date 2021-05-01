import 'dart:ui';
import 'package:App/service/api.dart';
import 'package:App/components/CustomButton.dart';
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
        alignment: Alignment.center,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://assets.instabuy.com.br/ib.item.image.small/s-${items[i]['images'][0]}',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Project for InstaBuy'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          CustomButton(),
          Container(
              margin: EdgeInsets.only(top: 48),
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                collectionItems[index]['title'],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 0),
                              width: MediaQuery.of(context).size.width,
                              height: 270,
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
                    ))
        ],
      ),
    );
  }
}
