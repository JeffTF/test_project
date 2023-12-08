import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key, required this.continueClick,});
  final Function() continueClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 3),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 3,
                color: Colors.black38,
              )
            ]),
        child:  Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
              child: Calendar()),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectedBox(text: 'Today', color: Colors.grey),
                SelectedBox(text: 'Available', color: Colors.grey),
                SelectedBox(text: 'Selected', color: Colors.black),
              ],
            ),
            const Spacer(),
            Padding(padding: const EdgeInsets.all(30),
            child: Button(
                buttonText: 'continue',
                height: 40,
              onTap: continueClick,) //continueClick
            )
          ],
        ),
      ),
    );
  }
}

class SelectedBox extends StatelessWidget {
  const SelectedBox({super.key, required this.text, required this.color});
final String text ;
final Color color ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 20,
          decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(5)
          ),
        ),
        const SizedBox(width: 5,),
        Text(text),
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key, required this.buttonText, this.btnColor, this.btnTextColor, required this.onTap, this.border, required this.height, this.width, this.fontSize});
  final String buttonText;
  final Color? btnColor;
  final Color? btnTextColor;
  final Function() onTap;
  final Border? border;
  final double height;
  final double? width;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size ;
    return SizedBox(
      height: height,
      width: width ?? size.width,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(30),
          border: border,
        ),
        child: Material(
          color: btnColor ?? Colors.black38,
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            // splashColor: KColor.kPrimarySplashColor,
            onTap: onTap,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: btnColor ?? Colors.white,
                  fontSize: fontSize ?? 16
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}

