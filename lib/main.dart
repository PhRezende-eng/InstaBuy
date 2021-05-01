import 'package:App/screens/banners.dart';
import 'package:App/screens/home_page.dart';
import 'package:App/screens/produtos.dart';
import 'package:App/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/first': (context) => BannersPage(),
        '/second': (context) => ProdutosPage(),
      },
      theme: ThemeData(
        primaryColor: orangeInstaB,
      ),
    );
  }
}
