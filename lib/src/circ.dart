// import 'dart:ffi';
// import 'dart:js';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_firestore/firebase_firestore.dart';

const barCol = Color(0xFF120E43);

class MyCirculars {
  final String date;
  final String title;

  MyCirculars({required this.date, required this.title});

  Map<String, dynamic> toJson() => {'date': date, 'title': title};

  static MyCirculars fromJson(Map<String, dynamic> json) => MyCirculars(
      date: (json['date'] ?? '').toString(),
      title: (json['title'] ?? '').toString());
}

Stream<List<MyCirculars>> readCircs() => FirebaseFirestore.instance
    .collection('circulars')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => MyCirculars.fromJson(doc.data())).toList());

class MyCircs extends StatelessWidget {
  const MyCircs({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontFamily: 'Raleway');

  Widget circBuild(MyCirculars circ) =>
      //Column(
      //   children: [
      //     Row(
      //       children: [Flexible(child: Center(child: Text(circ.date)))],
      //     ),
      //     Row(
      //       children: [Flexible(child: Text(circ.title))],
      //     )
      //   ],
      // );
      ListTile(
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          title: Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
              color: Colors.lightGreenAccent,
              child: Text(
                circ.date,
                textAlign: TextAlign.center,
              )),
          //tileColor: Colors.lightGreen,
          //contentPadding: const EdgeInsets.only(bottom: 50),

          subtitle: Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
            color: Colors.lightBlue,
            child: Text(circ.title),
          ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<List<MyCirculars>>(
          stream: readCircs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('There is an Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final circular = snapshot.data!;
              return ListView(
                  //itemExtent: 100,
                  //padding: const EdgeInsets.only(bottom: 20),
                  children: circular.map(circBuild).toList());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
