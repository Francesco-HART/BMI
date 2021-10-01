import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.resultBMI});

  String interpretation;
  int resultBMI;
  String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Header(), Body(), BottomButton()],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        child: Center(
          child: Text(
            'YOUR RESULT',
          ),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  Body(
      {@required this.resultBMI,
      @required this.resultText,
      @required this.interpretation});

  int resultBMI;
  String resultText;
  String interpretation;

  @override
  _BodyState createState() => _BodyState(
      resultBMI: resultBMI,
      resultText: resultText,
      interpretation: interpretation);
}

class _BodyState extends State<Body> {
  _BodyState(
      {@required this.resultBMI,
      @required this.resultText,
      @required this.interpretation});

  int resultBMI;
  String resultText;
  String interpretation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('$resultBMI'),
            Text('$resultText'),
            Text('$interpretation'),
            TextButton(child: Text('save result'))
          ],
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Card(
          child: TextButton(
            child: Text('RECALCULATE BMI'),
          ),
        ));
  }
}
