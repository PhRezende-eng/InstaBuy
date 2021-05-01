import 'dart:ui';
import 'package:App/service/api.dart';
import 'package:App/components/CustomButton.dart';
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
        automaticallyImplyLeading: false,
        title: Text(
          'Project for InstaBuy',
          style: TextStyle(color: Colors.white),
        ),
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
