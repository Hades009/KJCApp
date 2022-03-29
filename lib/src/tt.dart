import 'package:flutter/material.dart';

const barCol = Color(0xFF120E43);
const TextStyle headStyle = TextStyle(
    fontSize: 26,
    decoration: TextDecoration.underline,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold);

class MyTT extends StatelessWidget {
  const MyTT({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontFamily: 'Raleway');
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Center(
          child: Text(
            'YOUR TIME-TABLE',
            style: headStyle,
          ),
        ),
      ],
    );
  }
}
