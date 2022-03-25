import 'package:flutter/material.dart';

final barCol = Color(0xFF120E43);

class MyAttendance extends StatelessWidget {
  const MyAttendance({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontFamily: 'Raleway');
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Text('Attendance Page', style: optionStyle),
      ),
    );
  }
}
