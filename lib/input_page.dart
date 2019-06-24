import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gender_selector.dart';
import 'my_container.dart';

final inactive_card_color = Color.fromRGBO(29, 29, 46, 0.5);
final active_card_color = Color.fromRGBO(29, 29, 46, 1);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color male_card_color = inactive_card_color;
  Color female_card_color = inactive_card_color;

  void update_color(int gender) {
    //1-male 2-female
    setState(() {
      male_card_color = gender == 1
          ? (male_card_color == inactive_card_color
              ? active_card_color
              : inactive_card_color)
          : male_card_color;

      female_card_color = gender == 2
          ? (female_card_color == inactive_card_color
              ? active_card_color
              : inactive_card_color)
          : female_card_color;
    });
  }

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
                      update_color(1);
                    },
                    child: My_Container(
                      colour: male_card_color,
                      child: Gender_Selector('MALE', FontAwesomeIcons.male),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      update_color(2);
                    },
                    child: My_Container(
                      colour: female_card_color,
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
