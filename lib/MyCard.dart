import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({@required this.colorise, this.cardChild, @required this.onPress});

  Color colorise;
  final Function onPress;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        child: cardChild,
        margin: EdgeInsets.all(10),
        color: colorise,
      ),
    );
  }
}
