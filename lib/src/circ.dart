// import 'dart:ffi';
// import 'dart:js';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_firestore/firebase_firestore.dart';

const barCol = Color(0xFF120E43);

class MyCirculars {
  final String description;
  final String title;

  MyCirculars({required this.description, required this.title});

  Map<String, dynamic> toJson() => {'description': description, 'title': title};

  static MyCirculars fromJson(Map<String, dynamic> json) => MyCirculars(
      description: (json['description'] ?? '').toString(),
      title: (json['title'] ?? '').toString());
}

Stream<List<MyCirculars>> readCircs() => FirebaseFirestore.instance
    .collection('circulars')
    .where('visible', isEqualTo: true)
    .where('deleted', isEqualTo: false)
    // .where('verified', isEqualTo: true)
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
          contentPadding: const EdgeInsets.fromLTRB(6, 0, 6, 8),
          title: Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
              color: barCol,
              child: Text(
                circ.title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              )),
          //tileColor: Colors.lightGreen,
          //contentPadding: const EdgeInsets.only(bottom: 50),

          subtitle: Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
            color: const Color.fromARGB(255, 216, 216, 216),
            child: Text(circ.description),
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
