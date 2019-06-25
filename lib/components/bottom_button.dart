import 'package:flutter/material.dart';

import '../const.dart';

class BottomButton extends StatelessWidget {
  final String txt;
  final Function onTapFunc;
  final TextStyle textStyle;

  BottomButton(
      @required this.txt, @required this.onTapFunc, @required this.textStyle);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunc();
      },
      child: Container(
        child: Center(
          child: Text(
            txt,
            style: textStyle,
          ),
        ),
        color: kBtm_cnt_color,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10),
//            width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
