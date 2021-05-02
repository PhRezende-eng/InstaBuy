import 'dart:ui';
import 'package:App/service/api.dart';
import 'package:App/style.dart';
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
              child: Center(child: CircularProgressIndicator()),
            )
          : Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 8.0,
                right: 8.0,
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: banners.length,
                itemBuilder: (BuildContext context, int index) {
                  return banners[index]['is_mobile'] == false
                      ? Container()
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          child: Column(
                            children: [
                              Image.network(
                                'https://assets.instabuy.com.br/ib.store.banner/bnr-${banners[index]['image']}',
                              ),
                            ],
                          ),
                        );
                },
              ),
            ),
    );
  }
}
