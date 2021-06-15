import 'package:BMI/bottom_button.dart';
import 'package:BMI/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculations.dart';
class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  ResultsPage({@required this.bmiResult,@required this.interpretation,@required this.resultText});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Text(
              'Your Result',
              style: KtitleTextStyle,
            ),
          ),
          Expanded(
            child: ReusableCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        resultText,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        bmiResult,
                        style:TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ],
                ),
                colour: KactiveCardColor,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          BottomButton(
            ontap: (){
              Navigator.pop(context);
            },
            ButtonTitle: 'Re-Calculate',
          ),
        ],
      ),
    );
  }
}
