import 'package:flutter/material.dart';

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
                child: Text('Banners'),
                color: Colors.orange[300],
                onPressed: () {
                  Navigator.pushNamed(context, '/first');
                },
              ),
              MaterialButton(
                child: Text('Produtos'),
                color: Colors.orange[300],
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
