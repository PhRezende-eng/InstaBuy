import 'dart:ui';
import 'package:App/components/CustomProducts.dart';
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
