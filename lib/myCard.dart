import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  MyCard({@required this.colorise});
  Color colorise;

  @override
  _MyCardState createState() => _MyCardState(colorise: colorise);
}

class _MyCardState extends State<MyCard> {
  _MyCardState({@required this.colorise});

  final Color colorise;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      color: colorise,
    );
  }
}
