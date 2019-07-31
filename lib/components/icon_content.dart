import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData iconType;
  final String texto;

  IconContent({@required this.iconType, @required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconType,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          texto,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
