import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusablecard.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'brainbmi.dart';
enum Gender{
  male, female, notDefined,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height=180;
  int weight=60;
  int age= 18;
 Gender selectedGender= Gender.notDefined;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0A0E21),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF0A0E21),
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender= Gender.male;
                    });
                  },
                  child: ReusableCard(
                      colour: selectedGender== Gender.male ? kActiveCardColor :kInActiveCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE')
                  ),
                )
                ),
                Expanded(child:GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender= Gender.female;
                    });
                  },
                  child: ReusableCard(colour: selectedGender== Gender.female ? kActiveCardColor :kInActiveCardColor,
                    cardChild:
                  IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
                ),
              ],
            )
            ),
            Expanded(child: ReusableCard(colour: kActiveCardColor, cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children:  <Widget>[
                Text(
                  'HEIGHT',
                    style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTetStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor:  Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x26EB1555),
                    thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),

                  ),
                  child: Slider(value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                    setState(() {
                        height= newValue.round();
                    }
                    );
                      }
                  ),
                ),
              ],
            ),
            ),
            ),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child:ReusableCard(colour: kActiveCardColor, cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Text(
                     'WEIGHT',
                     style: kLabelTextStyle,
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          weight.toString(),
                          style: kNumberTetStyle,
                        ),
                        Text(
                          'kg',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(width: 10.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                          setState(() {
                            weight--;
                          });
                        }),
                        SizedBox(width: 10.0,),
                        RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                          setState(() {
                            weight++;
                          });
                        }),
                    ]

                    )
                  ],
                ))),
                Expanded(child: ReusableCard(colour: kActiveCardColor, cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      age.toString(),
                      style: kNumberTetStyle,
                    ),
                    SizedBox(width: 10.0,),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                            setState(() {
                              age--;
                            });
                          }),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                            setState(() {
                              age++;
                            });
                          }),
                        ]

                    )
                  ],
                )

                ))
              ],
            )),
            BottomButton(onTap: (){
              CalculatorBrain calc= CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
              ),
              )
              );
            },
            buttonTitle: 'CALCULATE',)
          ],
        )
    );
  }
}
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback  onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      child: Icon(icon,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}






