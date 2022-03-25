// ignore_for_file: file_names

import 'package:flutter/material.dart';

const barCol = Color(0xFF120E43);

class MyAcc extends StatelessWidget {
  const MyAcc({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontFamily: 'Raleway');
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Text('Account', style: optionStyle),
      ),
    );
  }
}
