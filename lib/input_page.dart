import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gender_selector.dart';
import 'my_container.dart';

enum Gender { male, female }
final inactive_card_color = Color.fromRGBO(29, 29, 46, 0.5);
final active_card_color = Color.fromRGBO(29, 29, 46, 1);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: My_Container(
                      colour: selectedGender == Gender.male
                          ? active_card_color
                          : inactive_card_color,
                      child: Gender_Selector('MALE', FontAwesomeIcons.male),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: My_Container(
                      colour: selectedGender == Gender.female
                          ? active_card_color
                          : inactive_card_color,
                      child: Gender_Selector('FEMALE', FontAwesomeIcons.female),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: new My_Container(
              colour: inactive_card_color,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: My_Container(
                    colour: inactive_card_color,
                  ),
                ),
                Expanded(
                  child: My_Container(
                    colour: inactive_card_color,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.pink.shade400,
            margin: EdgeInsets.only(top: 10.0),
//            width: double.infinity,
            height: 80.0,
          )
        ],
      ),
    );
  }
}
