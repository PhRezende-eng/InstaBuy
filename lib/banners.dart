import 'dart:ui';

import 'package:App/API.dart';
import 'package:flutter/material.dart';

class BannersPage extends StatefulWidget {
  @override
  _BannersPageState createState() => _BannersPageState();
}

class _BannersPageState extends State<BannersPage> {
  List<dynamic> banners;

  bool isLoad = true;

  void getData() async {
    var response = await fetch();

    setState(() {
      banners = response['data']['banners'];
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
                      padding: EdgeInsets.all(8.0),
                      itemCount: banners.length,
                      itemBuilder: (BuildContext context, int index) {
                        return banners[index]['is_mobile'] == false
                            ? Container()
                            : Container(
                                padding: EdgeInsets.only(bottom: 0),
                                width: MediaQuery.of(context).size.width,
                                height: 180,
                                child: Column(
                                  children: [
                                    Image.network(
                                        'https://assets.instabuy.com.br/ib.store.banner/bnr-${banners[index]['image']}'),
                                  ],
                                ));
                      },
                    ))
        ],
      ),
    );
  }
}
