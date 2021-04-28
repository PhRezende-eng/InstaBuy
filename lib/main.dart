import 'package:App/screens/banners.dart';
import 'package:App/screens/produtos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/first',
      routes: {
        '/first': (context) => BannersPage(),
        '/second': (context) => ProdutosPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
