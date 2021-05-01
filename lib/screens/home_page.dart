import 'package:App/screens/banners.dart';
import 'package:App/screens/produtos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _screenIndex = 0;
  final List<Widget> _screens = [
    BannersPage(),
    ProdutosPage(),
  ];

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
      body: _screens[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: Colors.white,
        currentIndex: _screenIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_headline,
              size: 26,
            ),
            // ignore: deprecated_member_use
            title: Text("Banners"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket,
              size: 26,
            ),
            // ignore: deprecated_member_use
            title: Text("Produtos"),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _screenIndex = index;
    });
  }
}
