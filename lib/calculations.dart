import 'constants.dart';
import 'dart:math';
class CalculatorBrain{
  final int height;
  final int weight;
  double _bmi;
  CalculatorBrain({this.height,this.weight});
  String CalculateBmi(){
    _bmi = (weight*10000)/pow(height,2);
    return _bmi.toStringAsFixed(1);
  }
  String getResults(){
    if (_bmi>=25){
      return 'OVERWEIGHT';
    }else if(_bmi>18.5){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }
  String getInterpretation(){
    if (_bmi>=25){
      return 'You have a higher than normal body weight. Try to exercise more';
    }else if(_bmi>18.5){
      return 'You have a normal body weight. Good Job!';
    }else{
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}