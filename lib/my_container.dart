import 'package:flutter/material.dart';

class My_Container extends StatelessWidget {
  final Color colour;
  final Widget child;
  final Function onTapFunc;
  My_Container({@required this.colour, this.child, this.onTapFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunc();
      },
      child: Container(
        child: child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colour,
        ),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}
