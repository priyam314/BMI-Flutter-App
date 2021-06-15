import 'package:BMI/calculations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_card.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'results_page.dart';
import 'bottom_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
enum Gender {male,female}
class _InputPageState extends State<InputPage> {

  void updateColor(Gender gender) {
    maleCardColor = (gender==Gender.male)?KactiveCardColor:KinactiveCardColor;
    femaleCardColor = (gender==Gender.female)?KactiveCardColor:KinactiveCardColor;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {                         //first class citizen
                          updateColor(Gender.male);          //passed anonymous function
                        });
                      },
                      child: GenderCard(
                        genderIcon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                        colour:maleCardColor,
                    ),
                ),
                Expanded(
                    child:ReusableCard(
                      onPress: (){
                        setState(() {
                          updateColor(Gender.female);
                        });
                      },
                      child: GenderCard(
                        genderIcon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                        colour:femaleCardColor,
                    ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: KlabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: KnumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: KlabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      activeTickMarkColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height=newValue.toInt();
                          });
                        },
                    ),
                  ),
                ],
              ),
                colour:KactiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child:ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children :<Widget>[
                          Text(
                            'WEIGHT',
                            style: KlabelTextStyle,
                          ),
                          Container(
                            height : 70.0,
                            width : 120.0,
                            child: ListWheelScrollView(
                              diameterRatio: 0.9,
                                itemExtent: 80,
                                squeeze: 2.5,
                                children: new List<ReusableCard>.generate(170,
                                    (i) => ReusableCard(
                                      onPress: (){
                                        setState(() {
                                          weight++;
                                        });
                                        print(weight);
                                      },
                                        colour:KinactiveCardColor,
                                        child: Center(
                                          child: Text(
                                              (i+30).toString(),
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                    )
                                ),
                            ),
                          ),
                          // Text(
                          //   weight.toString(),
                          //   style: KnumberTextStyle,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress:(){
                                  setState(() {
                                    weight--;
                                  });
                                } ,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon:FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                        colour:KactiveCardColor,
                    ),
                ),
                Expanded(
                    child:ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children :<Widget>[
                          Text(
                            'AGE',
                            style: KlabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: KnumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress:(){
                                  setState(() {
                                    age--;
                                  });
                                } ,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon:FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                        colour:KactiveCardColor,
                    ),
                ),
              ],
            ),
          ),
          BottomButton(
            ontap: (){
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                        builder: (context)=>ResultsPage(
                          bmiResult: calc.CalculateBmi(),
                          resultText: calc.getResults(),
                          interpretation: calc.getInterpretation(),
                        )),
                        );
                },
            ButtonTitle: 'CALCULATE',
          ),
        ],
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData(
      //     accentColor: Colors.grey.shade900,            //gives more granular control to change a particular theme
      //   ),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //   ),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



