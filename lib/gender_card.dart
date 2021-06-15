import 'package:flutter/material.dart';
import 'constants.dart';
class GenderCard extends StatelessWidget {
  final IconData genderIcon;
  final String label;
  GenderCard({this.genderIcon,this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size:80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style:KlabelTextStyle,
        ),
      ],
    );
  }
}