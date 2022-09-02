import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/imput_page.dart';
import 'package:bmicalculator/reusablecard.dart';
import 'package:flutter/material.dart';
import 'reusablecard.dart';
import 'constants.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.interpretation,
        required this.bmiResult,
        required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
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
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your result',
                  style: kTextResultStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText,
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                      )
                    ],
                  )),
            ),
            BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonTitle: 'RE-CALCULATE')
          ],
        ));
  }
}
