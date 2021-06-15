import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  //getting yellow line below ReusableCard because
  // This class (or a class that this class inherits from) is marked as '@immutable',
  // but one or more of its instance fields aren't final: ReusableCard.colour
  //so it wants Color colour to be immutable, we have two options , either use const or final,
  // at a glance , both of them may look same in working, but they have subtle differences,
  // const is executes at the compile time, while final is executed at anytime,
  // Its not important that this ReusableCard class would be compiled at compile time,
  //it may get compiled after whole program being executed, and so we use final here, not const
  final Color colour;
  final Widget child;
  final Function onPress;
  ReusableCard({@required this.colour,this.child,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color : colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}