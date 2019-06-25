import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/my_container.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class ResultsPage extends StatelessWidget {
  final String bmi_res;
  final String bmi_res_text;
  final String bmi_res_desc;

  ResultsPage(this.bmi_res, this.bmi_res_text, this.bmi_res_desc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Results', style: k_res_title_txt_style),
            ),
          ),
          Expanded(
            flex: 5,
            child: My_Container(
              colour: kActive_card_color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmi_res_text,
                    style: k_res_result_txt_style,
                  ),
                  Text(
                    bmi_res_text,
                    style: k_res_bmi_style,
                  ),
                  Text(
                    bmi_res_desc,
                    style: k_res_body_style,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton('RECALCULATE BMI', () {
            Navigator.pop(context);
          }, k_calc_txt_style),
        ],
      ),
    );
  }
}
