import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  final Function ontap;
  final String ButtonTitle;
  BottomButton({@required this.ontap,@required this.ButtonTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            ButtonTitle,
            style: KnumberTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        color: KactiveBottomContainerColor,
        width: double.infinity,
        height: KbottomContainerHeight,
      ),
    );
  }
}
