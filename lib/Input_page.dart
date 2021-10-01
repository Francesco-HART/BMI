import 'package:bmi_calculator/GenderEnum.dart';
import 'package:bmi_calculator/MyIcon.dart';
import 'package:bmi_calculator/MyCard.dart';
import 'package:bmi_calculator/ResultPage.dart';
import 'package:flutter/material.dart';

const Color initStyleColor = Color(0xFF111328);
const Color selectStyleColorMan = Color(0xFFEB1555);
const Color selectStyleColorGirl = Colors.blue;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color textColor = initStyleColor;
  Gender genderDetector;
  double valueHeight = 170;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MyCard(
                        onPress: () {
                          setState(() {
                            genderDetector = Gender.man;
                          });
                        },
                        colorise: genderDetector == Gender.man
                            ? selectStyleColorMan
                            : initStyleColor,
                        cardChild: MyIconCard(
                          description: "MAN",
                          icon: Icons.male,
                        ),
                      ),
                    ),
                    Expanded(
                      child: MyCard(
                        onPress: () {
                          setState(() {
                            genderDetector = Gender.girl;
                          });
                        },
                        colorise: genderDetector == Gender.girl
                            ? selectStyleColorGirl
                            : initStyleColor,
                        cardChild: MyIconCard(
                          description: "GIRL",
                          icon: Icons.female,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: MyCard(
                  onPress: () => print(""),
                  colorise: initStyleColor,
                  cardChild: SliderCard(
                    valueHeight: valueHeight,
                    onChange: (double value) {
                      setState(() {
                        valueHeight = value.roundToDouble();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: OtherCardChild(
                      description: "WEIGHT",
                    )),
                    Expanded(child: OtherCardChild(description: "AGE")),
                  ],
                ),
              ),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Theme(
        data: ThemeData(
          accentColor: Color(0xFFEB1555),
        ),
        child: FloatingActionButton(
          child: Icon(Icons.info),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SliderCard extends StatelessWidget {
  SliderCard({@required this.onChange, @required this.valueHeight});

  String title = "HEIGHT";
  double valueHeight;
  Function onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '$valueHeight',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'CM',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTickMarkColor: Colors.white,
            thumbColor: Color(0xFFEB1555),
            overlayColor: Color(0x29EB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          ),
          child: Slider(
            value: valueHeight,
            onChanged: onChange,
            min: 0,
            max: 250,
            activeColor: Color(0xFFEB1555),
          ),
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: RawMaterialButton(
        child: Icon(icon),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(width: 60, height: 60),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        onPressed: onPress,
      ),
    );
  }
}

class OtherCardChild extends StatefulWidget {
  OtherCardChild({
    @required this.description,
  }) {
    this.value = description == "AGE" ? 21 : 90;
  }
  final String description;
  int value;

  @override
  _OtherCardChildState createState() =>
      _OtherCardChildState(value: value, description: description);
}

class _OtherCardChildState extends State<OtherCardChild> {
  _OtherCardChildState({@required this.description, @required value}) {
    this.value = description == "AGE" ? 21 : 90;
  }
  final String description;
  int value;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            description,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoundIconButton(
                onPress: () {
                  setState(() {
                    value++;
                  });
                },
                icon: Icons.add,
              ),
              Text('$value'),
              RoundIconButton(
                onPress: () {
                  setState(() {
                    value--;
                  });
                },
                icon: Icons.remove,
              ),
            ],
          )
        ],
      ),
      margin: EdgeInsets.all(10),
      color: initStyleColor,
    );
  }
}
