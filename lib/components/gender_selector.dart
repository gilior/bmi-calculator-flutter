import 'package:flutter/material.dart';

class Gender_Selector extends StatelessWidget {
  final String gender;
  final IconData icon;

  Gender_Selector(this.gender, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: TextStyle(color: Colors.grey.shade200, fontSize: 18),
        )
      ],
    );
  }
}
