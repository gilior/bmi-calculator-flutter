import 'package:bmi_calculator/bl/bmi_calc.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/gender_selector.dart';
import 'package:bmi_calculator/components/my_container.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../const.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLbl_txt_stl,
                        ),
                        Text(
                          weight.toString(),
                          style: kNmb_cnt_color,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                weight++;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                weight--;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                    colour: kInactive_card_color,
                  ),
                ),
                Expanded(
                  child: My_Container(
                    colour: kInactive_card_color,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLbl_txt_stl,
                        ),
                        Text(
                          age.toString(),
                          style: kNmb_cnt_color,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton('CALCULATE BMI', () {
            BmiCalc bmiCalc = BmiCalc(height, weight);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(bmiCalc.calc_bmi(),
                        bmiCalc.to_text(), bmiCalc.to_desc())));
          }, k_calc_txt_style)
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

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onClickFunc;

  RoundIconButton(this.icon, this.onClickFunc);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Colors.blueGrey,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: () {
        onClickFunc();
      },
    );
  }
}
