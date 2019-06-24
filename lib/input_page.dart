import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'const.dart';
import 'gender_selector.dart';
import 'my_container.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: My_Container(
                    onTapFunc: onMaleFunc,
                    colour: selectedGender == Gender.male
                        ? kActive_card_color
                        : kInactive_card_color,
                    child: Gender_Selector('MALE', FontAwesomeIcons.male),
                  ),
                ),
                Expanded(
                  child: My_Container(
                    onTapFunc: onFeMaleFunc,
                    colour: selectedGender == Gender.female
                        ? kActive_card_color
                        : kInactive_card_color,
                    child: Gender_Selector('FEMALE', FontAwesomeIcons.female),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: new My_Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLbl_txt_stl,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNmb_cnt_color,
                      ),
                      Text(
                        'cm',
                        style: kLbl_txt_stl,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Colors.grey,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.pink,
                        overlayColor: Colors.pink.withAlpha(overlayLightAlpha)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (val) {
                        setState(() {
                          height = val.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
              colour: kInactive_card_color,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: My_Container(
                    colour: kInactive_card_color,
                  ),
                ),
                Expanded(
                  child: My_Container(
                    colour: kInactive_card_color,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBtm_cnt_color,
            margin: EdgeInsets.only(top: 10.0),
//            width: double.infinity,
            height: 80.0,
          )
        ],
      ),
    );
  }

  void onMaleFunc() {
    setState(() {
      selectedGender = Gender.male;
    });
  }

  void onFeMaleFunc() {
    setState(() {
      selectedGender = Gender.female;
    });
  }
}
