import 'package:App/style.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class CustomButton extends StatefulWidget {
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  FontWeight getButtonWeight(bool isSelected) {
    return isSelected ? FontWeight.bold : FontWeight.normal;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                child: Text(
                  'Banners',
                  style: TextStyle(color: Colors.white),
                ),
                color: orangeInstaB,
                onPressed: () {
                  Navigator.pushNamed(context, '/first');
                },
              ),
              MaterialButton(
                child: Text(
                  'Produtos',
                  style: TextStyle(color: Colors.white),
                ),
                color: orangeInstaB,
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
