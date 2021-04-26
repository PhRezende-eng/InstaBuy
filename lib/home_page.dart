import 'package:App/API.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> banners;
  List<dynamic> collectionItems;

  bool isLoad = true;

  void getData() async {
    var response = await fetch();

    setState(() {
      banners = response['data']['banners'];
      collectionItems = response['data']['collection_items'];
      isLoad = false;
    });
    print(response['data']['banners']);
    print('\n');
    print(response['data']['collection_items']);
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: isLoad
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(8.0),
                itemCount: banners.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Column(
                      children: [
                        Image.network(
                            'https://assets.instabuy.com.br/ib.store.banner/bnr-${banners[index]['image']}'),
                        Text(banners[index]['title']),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
