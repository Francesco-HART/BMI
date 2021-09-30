import 'package:flutter/material.dart';

class MyIconCard extends StatelessWidget {
  MyIconCard({@required this.icon, @required this.description, this.child});
  final IconData icon;
  final String description;
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: 60,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
