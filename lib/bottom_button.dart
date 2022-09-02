import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusablecard.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});
  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 5.0),
        width: double.infinity,
        height: 65.0,
      ),
    );
  }
}
